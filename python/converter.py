import os
import pathlib
import shutil

import tomllib

from hx_ts_scopes import hx_ts_scopes
from kts_scopes import kts_scopes
from hx_lsp import hx_lsp


def convert(themes, theme):
    """
    Converts Helix theme to Kakoune.
    """
    preprocessed = preprocess(themes, theme)
    kakoune_theme = process(preprocessed)
    return kakoune_theme


def preprocess(themes, theme):
    """
    Resolves 'inherits' keys in Helix TOML theme,
    by copying all parent keys into the child.
    """
    if "inherits" in theme:
        parent = preprocess(themes, themes[theme["inherits"]])
        result = {}
        result.update(parent)
        result.update(theme)
        del result["inherits"]
        return result
    else:
        return theme


def process(theme):
    """
    Builds a Kakoune theme from Helix.
    """
    result = ""
    result += palette(theme)

    background = scope_value(theme.get("ui.background", ""))
    text = scope_value(theme.get("ui.text", ""))
    s = "# Standard Kakoune\n"
    s += "set-face global Default default,default,default\n"
    s += f'set-face global Default {background[:-1]}@Default"\n'
    s += f'set-face global Default {text[:-1]}@Default"\n\n'
    result += s

    result += scopes(theme)
    result += lsp(theme)
    return result


def palette(theme):
    """
    Seeks for 'palette' TOML table in Helix theme,
    and maps its keys to Kakoune's 'declare-option str'.

    https://docs.helix-editor.com/themes.html#color-palettes.
    """
    result = ""
    if "palette" in theme:
        colors = theme["palette"].items()
        faces = [(k.replace(".", "_").replace("-", "_"), color(c)) for k, c in colors]
        faces = ["# palette"] + [f'declare-option str {k} "{v}"' for k, v in faces]
        result = "\n".join(faces)
        del theme["palette"]
    result += "\n\n"
    return result


def scopes(theme):
    """
    Maps Helix highlighting scopes to kak-tree-sitter.
    Both are based on tree-sitter.

    https://docs.helix-editor.com/themes.html#scopes
    """

    def fallbacks(res):
        """Explicitly sets all kak-tree-sitter highlighting scopes."""
        for key in kts_scopes:
            # ts_keyword_control_conditional
            elements = key.split("_")
            # [3, 2]
            for n in reversed(range(2, len(elements))):  # 3, 2
                # 3: ts_keyword_control_conditional, 2: ts_keyword_control
                child = "_".join(elements[: n + 1])
                # 3: ts_keyword_control, 2: ts_keyword
                parent = "_".join(elements[:n])
                # 3: {ts_keyword_control_conditional: ts_keyword_control}
                # 2: {ts_keyword_control: ts_keyword}
                res.update(dict([(child, res.get(child, parent))]))

    result = []
    for key, value in theme.items():
        if key in hx_ts_scopes:
            kts_key = "ts_" + key.replace(".", "_")
            if kts_key in kts_scopes:
                result.append((kts_key, scope_value(value)))
    result = dict(result)
    fallbacks(result)
    result = [f"set-face global {k} {v}" for k, v in result.items()]
    result = ["# kak-tree-sitter"] + sorted(result)
    result = "\n".join(result)
    return result


def lsp(theme):
    """
    Maps Helix highlighting scopes to kakoune-lsp.

    https://docs.helix-editor.com/themes.html#syntax-highlighting.

    https://github.com/kakoune-lsp/kakoune-lsp/blob/6f89cac346a3f0e30f9de9b82d9c23c9656a50fb/rc/lsp.kak#L81.
    """
    result = []
    for hx, lsp in hx_lsp.items():
        if hx in theme:
            result.append((lsp, scope_value(theme[hx])))
    result = [f"set-face global {k} {v}" for k, v in result]
    result = ["\n\n# kakoune-lsp"] + sorted(result)
    result = "\n".join(result)
    return result


def scope_value(scope):
    """
    Maps Helix scope value to Kakoune.

    https://docs.helix-editor.com/themes.html#overview.
    """
    result = ""
    if isinstance(scope, str):
        result = color(scope)
    else:
        fg = color(scope.get("fg", ""))
        bg = color(scope.get("bg", ""))
        if bg != "":
            bg = "," + bg
        underline = color(scope.get("underline", {}).get("color", ""))
        if bg != "" and underline != "":
            underline = "," + underline
        underline_curly = "style" in scope.get("underline", {})
        attributes = ""
        for modifier in scope.get("modifiers", []):
            if modifier == "bold":
                attributes += "b"
            elif modifier == "crossed_out":
                attributes += "s"
            elif modifier == "dim":
                attributes += "d"
            elif modifier == "italic":
                attributes += "i"
            elif modifier == "rapid_blink" or modifier == "slow_blink":
                attributes += "B"
            elif modifier == "underlined":
                if underline_curly:
                    attributes += "c"
                else:
                    attributes += "u"
        if attributes != "":
            attributes = "+" + attributes
        result = f"{fg}{bg}{underline}{attributes}"
    result = f'"{result}"'
    return result


def color(c):
    """
    Maps Helix color definition to Kakoune.

    https://docs.helix-editor.com/themes.html#color-palettes.

    https://github.com/mawww/kakoune/blob/610d4114a92a31819f45b734dddb4f173b661168/doc/pages/faces.asciidoc.
    """
    hx_ansi = {
        "black": "black",
        "gray": "bright-black",
        "light-gray": "white",
        "white": "bright-white",
        "blue": "blue",
        "cyan": "cyan",
        "default": "default",
        "green": "green",
        "magenta": "magenta",
        "red": "red",
        "yellow": "yellow",
        "light-blue": "bright-blue",
        "light-cyan": "bright-cyan",
        "light-green": "bright-green",
        "light-magenta": "bright-magenta",
        "light-red": "bright-red",
        "light-yellow": "bright-yellow",
    }
    if c.startswith("#"):
        return c.upper().replace("#", "rgb:")
    else:
        if c in hx_ansi:
            return hx_ansi.get(c)
        elif c != "":
            c = c.replace(".", "_").replace("-", "_")
            return f"%opt{{{c}}}"
        else:
            return ""


def main():
    def read(theme):
        with open(theme, "rb") as f:
            return tomllib.load(f)

    def write(name, theme):
        with open(f"./colors/{name}.kak", "w") as file:
            file.write(theme)

    themes = dict(
        [
            (file.stem, read(file))
            for file in pathlib.Path("./themes").iterdir()
            if file.suffix == ".toml"
        ]
    )

    kakoune_themes = dict(
        [
            (name.replace("_", "-"), convert(themes, theme))
            for name, theme in themes.items()
        ]
    )

    shutil.rmtree("./colors", ignore_errors=True)
    os.mkdir("./colors")

    for name, theme in kakoune_themes.items():
        write(name, theme)


main()
