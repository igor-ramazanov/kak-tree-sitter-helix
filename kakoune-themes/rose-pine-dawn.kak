declare-option str base 'rgb:FAF4ED'
declare-option str surface 'rgb:FFFAF3'
declare-option str overlay 'rgb:F2E9E1'
declare-option str muted 'rgb:9893A5'
declare-option str subtle 'rgb:797593'
declare-option str text 'rgb:575279'
declare-option str love 'rgb:B4637A'
declare-option str love_10 'rgb:F6E4E0'
declare-option str gold 'rgb:EA9D34'
declare-option str gold_10 'rgb:FBEAD8'
declare-option str rose 'rgb:D7827E'
declare-option str rose_10 'rgb:FAE8E1'
declare-option str pine 'rgb:286983'
declare-option str pine_10 'rgb:E5E6E2'
declare-option str foam 'rgb:56949F'
declare-option str foam_10 'rgb:EAEAE5'
declare-option str iris 'rgb:907AA9'
declare-option str iris_10 'rgb:F1E8E6'
declare-option str highlight_low 'rgb:F4EDE8'
declare-option str highlight_med 'rgb:DFDAD9'
declare-option str highlight_high 'rgb:CECACD'
set-face global ts_special %opt{rose}
set-face global ts_attribute %opt{iris}
set-face global ts_type %opt{foam}
set-face global ts_constructor %opt{foam}
set-face global ts_constant %opt{foam}
set-face global ts_constant_builtin_boolean %opt{rose}
set-face global ts_constant_character %opt{gold}
set-face global ts_constant_character_escape %opt{pine}
set-face global ts_constant_numeric %opt{gold}
set-face global ts_string %opt{gold}
set-face global ts_comment "%opt{muted}+Fi"
set-face global ts_variable %opt{text}
set-face global ts_variable_builtin %opt{love}
set-face global ts_variable_parameter %opt{iris}
set-face global ts_variable_other_member %opt{foam}
set-face global ts_label %opt{foam}
set-face global ts_punctuation %opt{subtle}
set-face global ts_keyword %opt{pine}
set-face global ts_keyword_operator %opt{subtle}
set-face global ts_operator %opt{subtle}
set-face global ts_function %opt{rose}
set-face global ts_function_builtin %opt{love}
set-face global ts_tag %opt{foam}
set-face global ts_namespace %opt{text}
set-face global ts_markup_heading_marker %opt{muted}
set-face global ts_markup_heading "%opt{iris}+Fb"
set-face global ts_markup_heading_1 "%opt{iris}+Fb"
set-face global ts_markup_heading_2 "%opt{foam}+Fb"
set-face global ts_markup_heading_3 "%opt{rose}+Fb"
set-face global ts_markup_heading_4 "%opt{gold}+Fb"
set-face global ts_markup_heading_5 "%opt{pine}+Fb"
set-face global ts_markup_heading_6 "%opt{foam}+Fb"
set-face global ts_markup_bold "+Fb"
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_markup_link_url "%opt{iris}%opt{iris}+F"
set-face global ts_markup_link_label %opt{subtle}
set-face global ts_markup_link_text %opt{text}
set-face global ts_markup_quote %opt{subtle}
set-face global ts_markup_raw %opt{subtle}
set-face global ts_diff_plus %opt{foam}
set-face global ts_diff_minus %opt{love}
set-face global ts_diff_delta %opt{highlight_high}