import os
import pathlib
import shutil
import tomllib

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

    background = scope_value(theme.get("ui.background", ""))
    text = scope_value(theme.get("ui.text", ""))
    s = "# Standard Kakoune\n"
    s += f'set-face global Default {background[:-1]}@Default"\n'
    s += f'set-face global Default {text[:-1]}@Default"\n\n'
    result += s
    result += scopes(theme)
    return result


def palette(theme):
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
    def fallbacks(res):
        for key in kts_scopes:
            elements = key.split("_")
            for n in reversed(range(2, len(elements))):
                child = "_".join(elements[: n + 1])
                parent = "_".join(elements[:n])
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


def scope_value(scope):
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
