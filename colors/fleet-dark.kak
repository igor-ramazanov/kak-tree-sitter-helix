# palette
declare-option str White "rgb:FFFFFF"
declare-option str Gray 120 "rgb:D1D1D1"
declare-option str Gray 110 "rgb:C2C2C2"
declare-option str Gray 100 "rgb:A0A0A0"
declare-option str Gray 90 "rgb:898989"
declare-option str Gray 80 "rgb:767676"
declare-option str Gray 70 "rgb:5D5D5D"
declare-option str Gray 60 "rgb:484848"
declare-option str Gray 50 "rgb:383838"
declare-option str Gray 40 "rgb:333333"
declare-option str Gray 30 "rgb:2D2D2D"
declare-option str Gray 20 "rgb:292929"
declare-option str Gray 10 "rgb:181818"
declare-option str Black "rgb:000000"
declare-option str Blue 110 "rgb:6DAAF7"
declare-option str Blue 100 "rgb:4D9BF8"
declare-option str Blue 90 "rgb:3691F9"
declare-option str Blue 80 "rgb:1A85F6"
declare-option str Blue 70 "rgb:0273EB"
declare-option str Blue 60 "rgb:0C6DDD"
declare-option str Blue 50 "rgb:195EB5"
declare-option str Blue 40 "rgb:194176"
declare-option str Blue 30 "rgb:163764"
declare-option str Blue 20 "rgb:132C4F"
declare-option str Blue 10 "rgb:0B1B32"
declare-option str Red 80 "rgb:EC7388"
declare-option str Red 70 "rgb:EA4B67"
declare-option str Red 60 "rgb:D93953"
declare-option str Red 50 "rgb:CE364D"
declare-option str Red 40 "rgb:C03248"
declare-option str Red 30 "rgb:A72A3F"
declare-option str Red 20 "rgb:761B2D"
declare-option str Red 10 "rgb:390813"
declare-option str Green 50 "rgb:4CA988"
declare-option str Green 40 "rgb:3EA17F"
declare-option str Green 30 "rgb:028764"
declare-option str Green 20 "rgb:134939"
declare-option str Green 10 "rgb:081F19"
declare-option str Yellow 60 "rgb:F8AB17"
declare-option str Yellow 50 "rgb:E1971B"
declare-option str Yellow 40 "rgb:B5791F"
declare-option str Yellow 30 "rgb:7C511A"
declare-option str Yellow 20 "rgb:5A3A14"
declare-option str Yellow 10 "rgb:281806"
declare-option str Purple 20 "rgb:C07BF3"
declare-option str Purple 10 "rgb:B35DEF"
declare-option str Blue "rgb:87C3FF"
declare-option str Blue Light "rgb:ADD1DE"
declare-option str Coral "rgb:CC7C8A"
declare-option str Cyan "rgb:82D2CE"
declare-option str Cyan Dark "rgb:779E9E"
declare-option str Lime "rgb:A8CC7C"
declare-option str Orange "rgb:E09B70"
declare-option str Pink "rgb:E394DC"
declare-option str Violet "rgb:AF9CFF"
declare-option str Yellow "rgb:EBC88D"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default ",%opt{Gray 10}@Default"
set-face global Default "%opt{Gray 120}@Default"

# kak-tree-sitter
set-face global ts_attribute "%opt{Lime}"
set-face global ts_comment "%opt{Gray 90}"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "%opt{Violet}"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean "%opt{Cyan}"
set-face global ts_constant_character "%opt{Yellow}"
set-face global ts_constant_character_escape "%opt{Cyan}"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric "%opt{Yellow}"
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "%opt{Yellow}"
set-face global ts_diff_delta "%opt{Blue 80}"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "%opt{Red 50}"
set-face global ts_diff_plus "%opt{Green 50}"
set-face global ts_function "%opt{Yellow}"
set-face global ts_function_builtin "%opt{Lime}"
set-face global ts_function_macro "%opt{Lime}"
set-face global ts_function_method ts_function
set-face global ts_function_special "%opt{Lime}"
set-face global ts_keyword "%opt{Cyan}"
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
set-face global ts_label "%opt{Yellow}"
set-face global ts_markup_bold "+b"
set-face global ts_markup_heading "%opt{Cyan}+b"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker ts_markup_heading
set-face global ts_markup_italic "+i"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label "%opt{Purple 20}"
set-face global ts_markup_link_text "%opt{Cyan}"
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "%opt{Pink}+iu"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered "%opt{Cyan}"
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered "%opt{Cyan}"
set-face global ts_markup_quote "%opt{Pink}"
set-face global ts_markup_raw "%opt{Pink}"
set-face global ts_markup_raw_block "rgb:EB83E2"
set-face global ts_markup_raw_inline "%opt{Cyan}"
set-face global ts_markup_strikethrough "+s"
set-face global ts_namespace "%opt{Blue}"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter ts_punctuation
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special "%opt{Lime}"
set-face global ts_string "%opt{Pink}"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp "%opt{Cyan}"
set-face global ts_string_special "%opt{Yellow}+u"
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "%opt{Blue}"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "%opt{Blue}"
set-face global ts_type_builtin ts_type
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant ts_type_enum
set-face global ts_variable "%opt{Gray 120}"
set-face global ts_variable_builtin "%opt{Coral}"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member "%opt{Violet}"
set-face global ts_variable_parameter ts_variable