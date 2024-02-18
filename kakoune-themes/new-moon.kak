# palette
declare-option str darkest 'rgb:2D2D2D'
declare-option str medium 'rgb:777C85'
declare-option str light 'rgb:B3B9C5'
declare-option str lightest 'rgb:FFFFFF'
declare-option str red 'rgb:F2777A'
declare-option str orange 'rgb:FCA369'
declare-option str yellow 'rgb:FFD479'
declare-option str light_yellow 'rgb:FFEEA6'
declare-option str green 'rgb:92D192'
declare-option str blue 'rgb:6AB0F3'
declare-option str darker_blue 'rgb:007ACC'
declare-option str darkest_blue 'rgb:264F78'
declare-option str aqua 'rgb:76D4D6'
declare-option str purple 'rgb:E1A6F2'
declare-option str beige 'rgb:AC8D58'
declare-option str light_gray 'rgb:EEEEEE'
declare-option str dark_gray_virtual 'rgb:606060'
declare-option str light_gray_virtual 'rgb:909090'
declare-option str active_line 'rgb:252525'
declare-option str text 'rgb:D4D4D4'
declare-option str cursor 'rgb:A6A6A6'
declare-option str widget 'rgb:252526'
declare-option str borders 'rgb:323232'

# kak-tree-sitter
set-face global ts_attribute "yellow+F"
set-face global ts_comment "%opt{medium}+F"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "%opt{purple}+F"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character "green+F"
set-face global ts_constant_character_escape "%opt{aqua}+F"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric "%opt{orange}+F"
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "blue+F"
set-face global ts_diff_delta "blue+F"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "red+F"
set-face global ts_diff_plus "green+F"
set-face global ts_function "%opt{lightest}+F"
set-face global ts_function_builtin "%opt{lightest}+F"
set-face global ts_function_macro "blue+F"
set-face global ts_function_method ts_function
set-face global ts_function_special ts_function
set-face global ts_keyword "%opt{light_yellow}+F"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control "%opt{light_yellow}+F"
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive "%opt{light_yellow}+F"
set-face global ts_keyword_function ts_keyword
set-face global ts_keyword_operator ts_keyword
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage ts_keyword
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label "blue+F"
set-face global ts_markup_bold "blue+Fb"
set-face global ts_markup_heading "blue+Fb"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker ts_markup_heading
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text %opt{orange}
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "+Fu"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote green
set-face global ts_markup_raw %opt{orange}
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline ts_markup_raw
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_namespace "blue+F"
set-face global ts_operator "%opt{beige}+F"
set-face global ts_punctuation "%opt{text}+F"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter "%opt{text}+F"
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special "%opt{lightest}+F"
set-face global ts_string "green+F"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp "%opt{orange}+F"
set-face global ts_string_special ts_string
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag blue
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "blue+F"
set-face global ts_type_builtin "blue+F"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant "blue+F"
set-face global ts_variable "red+F"
set-face global ts_variable_builtin "blue+F"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member "red+F"
set-face global ts_variable_parameter "red+F"