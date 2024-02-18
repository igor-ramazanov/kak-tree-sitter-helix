# palette
declare-option str bg_dim 'rgb:EFEBD4'
declare-option str bg0 'rgb:FDF6E3'
declare-option str bg1 'rgb:F4F0D9'
declare-option str bg2 'rgb:EFEBD4'
declare-option str bg3 'rgb:E6E2CC'
declare-option str bg4 'rgb:E0DCC7'
declare-option str bg5 'rgb:BDC3AF'
declare-option str bg_red 'rgb:FBE3DA'
declare-option str bg_visual 'rgb:EAEDC8'
declare-option str bg_yellow 'rgb:FAEDCD'
declare-option str bg_green 'rgb:F0F1D2'
declare-option str bg_blue 'rgb:E9F0E9'
declare-option str fg 'rgb:5C6A72'
declare-option str red 'rgb:F85552'
declare-option str orange 'rgb:F57D26'
declare-option str yellow 'rgb:DFA000'
declare-option str green 'rgb:8DA101'
declare-option str blue 'rgb:3A94C5'
declare-option str aqua 'rgb:35A77C'
declare-option str purple 'rgb:DF69BA'
declare-option str grey0 'rgb:A6B0A0'
declare-option str grey1 'rgb:939F91'
declare-option str grey2 'rgb:829181'
declare-option str statusline1 'rgb:93B259'
declare-option str statusline2 'rgb:708089'
declare-option str statusline3 'rgb:E66868'

# kak-tree-sitter
set-face global ts_attribute "%opt{purple}+Fi"
set-face global ts_comment "%opt{grey1}+Fi"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant %opt{fg}
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean %opt{purple}
set-face global ts_constant_character ts_constant
set-face global ts_constant_character_escape green
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric %opt{purple}
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor green
set-face global ts_diff_delta blue
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus red
set-face global ts_diff_plus green
set-face global ts_function green
set-face global ts_function_builtin ts_function
set-face global ts_function_macro green
set-face global ts_function_method ts_function
set-face global ts_function_special ts_function
set-face global ts_keyword red
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control ts_keyword
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive %opt{purple}
set-face global ts_keyword_function ts_keyword
set-face global ts_keyword_operator %opt{orange}
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage red
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label %opt{orange}
set-face global ts_markup_bold "+Fb"
set-face global ts_markup_heading ts_markup
set-face global ts_markup_heading_1 "red+Fb"
set-face global ts_markup_heading_2 "%opt{orange}+Fb"
set-face global ts_markup_heading_3 "yellow+Fb"
set-face global ts_markup_heading_4 "green+Fb"
set-face global ts_markup_heading_5 "blue+Fb"
set-face global ts_markup_heading_6 "%opt{purple}+Fb"
set-face global ts_markup_heading_marker %opt{grey1}
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label %opt{orange}
set-face global ts_markup_link_text %opt{purple}
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "blue+F"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote %opt{grey1}
set-face global ts_markup_raw ts_markup
set-face global ts_markup_raw_block %opt{aqua}
set-face global ts_markup_raw_inline green
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_namespace "yellow+Fi"
set-face global ts_operator %opt{orange}
set-face global ts_punctuation %opt{grey2}
set-face global ts_punctuation_bracket %opt{fg}
set-face global ts_punctuation_delimiter %opt{grey1}
set-face global ts_punctuation_special blue
set-face global ts_special blue
set-face global ts_string %opt{aqua}
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp green
set-face global ts_string_special yellow
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag %opt{orange}
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type yellow
set-face global ts_type_builtin ts_type
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant ts_type_enum
set-face global ts_variable %opt{fg}
set-face global ts_variable_builtin "%opt{purple}+Fi"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member blue
set-face global ts_variable_parameter %opt{fg}