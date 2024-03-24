# Mapping Helix to Kakoune LSP.
# Might have mapping problems.
# Missed Kakoune LSP faces:
# 1. ReferenceBind
# 2. InlayCodeLens

hx_lsp = {
    "warning": "LineFlagWarning",
    "error": "LineFlagError",
    "info": "LineFlagInfo",
    "hint": "LineFlagHint",
    "diagnostic.hint": "DiagnosticHint",
    "diagnostic.info": "DiagnosticInfo",
    "diagnostic.warning": "DiagnosticWarning",
    "diagnostic.error": "DiagnosticError",
    "ui.cursor.match": "Reference",
    "ui.virtual.inlay-hint": "InlayHint",
}
