# Mapping Helix to Kakoune LSP.
# Might have mapping problems.
# Missed Kakoune LSP faces:
# 1. ReferenceBind
# 2. InlayCodeLens

hx_to_lsp = {
    "warning": "LineFlagWarning",
    "error": "LineFlagError",
    "info": "LineFlagInfo",
    "hint": "LineFlagHint",
    "diagnostic.hint": "DiagnosticHint",
    "diagnostic.info": "DiagnosticHint",
    "diagnostic.warning": "DiagnosticHint",
    "diagnostic.error": "DiagnosticHint",
    "ui.cursor.match": "Reference",
    "ui.virtual.inlay-hint": "InlayHint",
}
