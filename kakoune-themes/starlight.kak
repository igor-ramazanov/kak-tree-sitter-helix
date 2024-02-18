# palette
declare-option str red 'rgb:FF4D51'
declare-option str green 'rgb:35D450'
declare-option str yellow 'rgb:E9E836'
declare-option str blue 'rgb:5DC5F8'
declare-option str dark_blue 'rgb:24ACD4'
declare-option str magenta 'rgb:FEABF2'
declare-option str cyan 'rgb:24DFC4'
declare-option str white 'rgb:FFFFFF'
declare-option str punct 'rgb:C9C9C9'
declare-option str black 'rgb:1E1E1E'
declare-option str dark_bg 'rgb:242424'
declare-option str medium_bg 'rgb:2D2D2D'
declare-option str light_bg 'rgb:353535'
declare-option str indent 'rgb:616161'
declare-option str dark_fg 'rgb:929292'
declare-option str light_fg 'rgb:E6E6E6'

# kak-tree-sitter
set-face global ts_attribute magenta
set-face global ts_comment %opt{dark_fg}
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant cyan
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character ts_constant
set-face global ts_constant_character_escape ts_constant_character
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric ts_constant
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor green
set-face global ts_diff_delta blue
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus red
set-face global ts_diff_plus green
set-face global ts_function green
set-face global ts_function_builtin ts_function
set-face global ts_function_macro ts_function
set-face global ts_function_method ts_function
set-face global ts_function_special ts_function
set-face global ts_keyword blue
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control ts_keyword
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive ts_keyword
set-face global ts_keyword_function ts_keyword
set-face global ts_keyword_operator ts_keyword
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage ts_keyword
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label blue
set-face global ts_markup_bold "magenta+Fb"
set-face global ts_markup_heading "white+Fb"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker "blue+Fb"
set-face global ts_markup_italic "magenta+Fi"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text yellow
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url ts_markup_link
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote magenta
set-face global ts_markup_raw green
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline ts_markup_raw
set-face global ts_markup_strikethrough red
set-face global ts_namespace white
set-face global ts_operator blue
set-face global ts_punctuation %opt{punct}
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter ts_punctuation
set-face global ts_punctuation_special cyan
set-face global ts_special blue
set-face global ts_string yellow
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp cyan
set-face global ts_string_special cyan
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag blue
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type cyan
set-face global ts_type_builtin ts_type
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant ts_type_enum
set-face global ts_variable white
set-face global ts_variable_builtin blue
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member magenta
set-face global ts_variable_parameter magenta