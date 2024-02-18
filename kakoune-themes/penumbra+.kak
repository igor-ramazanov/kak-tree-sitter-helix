declare-option str red 'rgb:DF7F78'
declare-option str orange 'rgb:CE9042'
declare-option str yellow 'rgb:9CA748'
declare-option str green 'rgb:50B584'
declare-option str cyan 'rgb:00B3C2'
declare-option str blue 'rgb:61A3E6'
declare-option str purple 'rgb:A48FE1'
declare-option str magenta 'rgb:D080B6'
declare-option str sun+ 'rgb:FFFDFB'
declare-option str sun 'rgb:FFF7ED'
declare-option str sun_ 'rgb:F2E6D4'
declare-option str sky+ 'rgb:CECECE'
declare-option str sky 'rgb:9E9E9E'
declare-option str sky_ 'rgb:636363'
declare-option str shade+ 'rgb:3E4044'
declare-option str shade 'rgb:24272B'
declare-option str shade_ 'rgb:181B1F'
set-face global ts_comment %opt{sky_}
set-face global ts_type green
set-face global ts_type_enum_variant green
set-face global ts_label blue
set-face global ts_tag blue
set-face global ts_constant %opt{purple}
set-face global ts_constant_numeric cyan
set-face global ts_constant_character %opt{purple}
set-face global ts_string yellow
set-face global ts_string_special_symbol cyan
set-face global ts_string_special_path cyan
set-face global ts_variable %opt{sky}
set-face global ts_variable_builtin red
set-face global ts_keyword magenta
set-face global ts_function blue
set-face global ts_function_macro %opt{purple}
set-face global ts_punctuation %opt{sky}
set-face global ts_operator magenta
set-face global ts_namespace %opt{sky}
set-face global ts_diff_plus green
set-face global ts_diff_minus red
set-face global ts_diff_delta cyan
set-face global ts_markup_heading "%opt{sky+}+Fb"
set-face global ts_markup_bold "+Fb"
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_markup_link_url "+Fu"
set-face global ts_markup_link_text magenta
set-face global ts_markup_quote green
set-face global ts_markup_raw %opt{orange}