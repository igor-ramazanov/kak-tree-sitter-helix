declare-option str bg0 'rgb:262221'
declare-option str bg1 'rgb:2E2A29'
declare-option str bg2 'rgb:383030'
declare-option str fg0 'rgb:EEE6D3'
declare-option str fg1 'rgb:CEA2CA'
declare-option str gray0 'rgb:635C4A'
declare-option str gray1 'rgb:52413F'
declare-option str green0 'rgb:91F368'
declare-option str selection0 'rgb:EE7042'
declare-option str selection1 'rgb:402E2E'
declare-option str type 'rgb:EED891'
declare-option str hint 'rgb:6BD9DB'
declare-option str info 'rgb:41B0F3'
declare-option str warn 'rgb:CFB05F'
declare-option str error 'rgb:E84C58'
declare-option str constant 'rgb:EF6787'
declare-option str valley_dark_fn 'rgb:7ED7E6'
declare-option str teal3 'rgb:49BDB0'
declare-option str aquamarine3 'rgb:53E6B5'
declare-option str ultramarine3 'rgb:9587DD'
set-face global ts_attribute %opt{fg1}
set-face global ts_keyword "%opt{teal3}+F"
set-face global ts_keyword_directive %opt{green0}
set-face global ts_namespace %opt{constant}
set-face global ts_punctuation %opt{fg0}
set-face global ts_punctuation_delimiter %opt{fg0}
set-face global ts_operator %opt{teal3}
set-face global ts_special %opt{ultramarine3}
set-face global ts_variable_other_member "%opt{selection0}+Fi"
set-face global ts_variable %opt{constant}
set-face global ts_variable_builtin %opt{teal3}
set-face global ts_variable_parameter %opt{constant}
set-face global ts_type %opt{type}
set-face global ts_type_builtin %opt{aquamarine3}
set-face global ts_constructor "%opt{type}+F"
set-face global ts_function "%opt{valley_dark_fn}+F"
set-face global ts_function_macro %opt{valley_dark_fn}
set-face global ts_function_builtin %opt{aquamarine3}
set-face global ts_tag %opt{green0}
set-face global ts_comment "%opt{gray0}+Fi"
set-face global ts_constant "%opt{constant}+F"
set-face global ts_string %opt{fg1}
set-face global ts_constant_numeric %opt{aquamarine3}
set-face global ts_constant_character_escape %opt{fg1}
set-face global ts_label %opt{ultramarine3}
set-face global ts_diff_plus %opt{green0}
set-face global ts_diff_delta %opt{type}
set-face global ts_diff_minus %opt{error}
set-face global ts_markup_heading %opt{type}
set-face global ts_markup_bold "+Fb"
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_markup_link_url "%opt{constant}+Fu"
set-face global ts_markup_link_text %opt{valley_dark_fn}
set-face global ts_markup_raw %opt{selection0}