import tomllib
import pathlib
import shutil
import os
from hx_ts_scopes import hx_ts_scopes
from kts_scopes import kts_scopes


def convert(themes, theme):
    preprocessed = preprocess(themes, theme)
    kakoune_theme = process(preprocessed)
    return kakoune_theme


def preprocess(themes, theme):
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
    result = ""
    result += palette(theme)
    result += scopes(theme)
    return result


def palette(theme):
    result = ""
    if "palette" in theme:
        colors = theme["palette"].items()
        faces = [(k.replace(".", "_").replace("-", "_"), color(c)) for k, c in colors]
        faces = [f"declare-option str {k} '{v}'" for k, v in faces]
        result = "\n".join(faces)
        del theme["palette"]
    result += "\n"
    return result


def scopes(theme):
    result = []
    for key, value in theme.items():
        if key in hx_ts_scopes:
            kts_key = "ts_" + key.replace(".", "_")
            if kts_key in kts_scopes:
                result.append((kts_key, scope_value(value)))
    result = [f"set-face global {k} {v}" for k, v in result]
    result = "\n".join(result)
    return result


def scope_value(scope):
    if isinstance(scope, str):
        return color(scope)
    else:
        fg = color(scope.get("fg", ""))
        bg = color(scope.get("bg", ""))
        if bg != "":
            bg = "," + bg
        underline = color(scope.get("underline", {}).get("color", ""))
        if bg != "" and underline != "":
            underline = "," + underline
        underline_curly = "style" in scope.get("underline", {})
        attributes = "+F"
        # TODO: `hidden` modifier is not supported in Kakoune.
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
        result = f'"{fg}{bg}{underline}{attributes}"'
        return result


# TODO: `gray` is not supported in Kakoune.
# TODO: what is `default` in Helix?
def color(c):
    hx_ansi = set(
        [
            "black",
            "blue",
            "cyan",
            "default",
            "gray",
            "green",
            "magenta",
            "red",
            "white",
            "yellow",
            "light-blue",
            "light-cyan",
            "light-gray",
            "light-green",
            "light-magenta",
            "light-red",
            "light-yellow",
        ]
    )
    if c.startswith("#"):
        return c.upper().replace("#", "rgb:")
    else:
        if c in hx_ansi:
            return c.replace("light", "bright")
        elif c != "":
            c = c.replace(".", "_").replace("-", "_")
            return f"%opt{{{c}}}"
        else:
            return ""


# TODO:
# 1. Map top level kak-tree-sitter faces to Kakoune default.
#   a. Get all possible default syntax highlighting Kakoune default faces.
# 2. Map UI faces.
#   a. https://docs.helix-editor.com/themes.html#interface
# 3. Map markup faces.
#   a. start with markup.*
# 4. Map kakoune-lsp faces.
def main():
    def read(theme):
        with open(theme, "rb") as f:
            return tomllib.load(f)

    def write(name, theme):
        with open(f"./kakoune-themes/{name}.kak", "w") as file:
            file.write(theme)

    themes = dict(
        [
            (file.stem, read(file))
            for file in pathlib.Path("./hx-themes").iterdir()
            if file.suffix == ".toml"
        ]
    )

    kakoune_themes = dict(
        [
            (name.replace("_", "-"), convert(themes, theme))
            for name, theme in themes.items()
        ]
    )

    shutil.rmtree("./kakoune-themes", ignore_errors=True)
    os.mkdir("./kakoune-themes")

    for name, theme in kakoune_themes.items():
        write(name, theme)


main()
