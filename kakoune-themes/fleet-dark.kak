declare-option str White 'rgb:FFFFFF'
declare-option str Gray 120 'rgb:D1D1D1'
declare-option str Gray 110 'rgb:C2C2C2'
declare-option str Gray 100 'rgb:A0A0A0'
declare-option str Gray 90 'rgb:898989'
declare-option str Gray 80 'rgb:767676'
declare-option str Gray 70 'rgb:5D5D5D'
declare-option str Gray 60 'rgb:484848'
declare-option str Gray 50 'rgb:383838'
declare-option str Gray 40 'rgb:333333'
declare-option str Gray 30 'rgb:2D2D2D'
declare-option str Gray 20 'rgb:292929'
declare-option str Gray 10 'rgb:181818'
declare-option str Black 'rgb:000000'
declare-option str Blue 110 'rgb:6DAAF7'
declare-option str Blue 100 'rgb:4D9BF8'
declare-option str Blue 90 'rgb:3691F9'
declare-option str Blue 80 'rgb:1A85F6'
declare-option str Blue 70 'rgb:0273EB'
declare-option str Blue 60 'rgb:0C6DDD'
declare-option str Blue 50 'rgb:195EB5'
declare-option str Blue 40 'rgb:194176'
declare-option str Blue 30 'rgb:163764'
declare-option str Blue 20 'rgb:132C4F'
declare-option str Blue 10 'rgb:0B1B32'
declare-option str Red 80 'rgb:EC7388'
declare-option str Red 70 'rgb:EA4B67'
declare-option str Red 60 'rgb:D93953'
declare-option str Red 50 'rgb:CE364D'
declare-option str Red 40 'rgb:C03248'
declare-option str Red 30 'rgb:A72A3F'
declare-option str Red 20 'rgb:761B2D'
declare-option str Red 10 'rgb:390813'
declare-option str Green 50 'rgb:4CA988'
declare-option str Green 40 'rgb:3EA17F'
declare-option str Green 30 'rgb:028764'
declare-option str Green 20 'rgb:134939'
declare-option str Green 10 'rgb:081F19'
declare-option str Yellow 60 'rgb:F8AB17'
declare-option str Yellow 50 'rgb:E1971B'
declare-option str Yellow 40 'rgb:B5791F'
declare-option str Yellow 30 'rgb:7C511A'
declare-option str Yellow 20 'rgb:5A3A14'
declare-option str Yellow 10 'rgb:281806'
declare-option str Purple 20 'rgb:C07BF3'
declare-option str Purple 10 'rgb:B35DEF'
declare-option str Blue 'rgb:87C3FF'
declare-option str Blue Light 'rgb:ADD1DE'
declare-option str Coral 'rgb:CC7C8A'
declare-option str Cyan 'rgb:82D2CE'
declare-option str Cyan Dark 'rgb:779E9E'
declare-option str Lime 'rgb:A8CC7C'
declare-option str Orange 'rgb:E09B70'
declare-option str Pink 'rgb:E394DC'
declare-option str Violet 'rgb:AF9CFF'
declare-option str Yellow 'rgb:EBC88D'
set-face global ts_attribute %opt{Lime}
set-face global ts_type %opt{Blue}
set-face global ts_constructor %opt{Yellow}
set-face global ts_constant %opt{Violet}
set-face global ts_constant_builtin_boolean %opt{Cyan}
set-face global ts_constant_character %opt{Yellow}
set-face global ts_constant_character_escape %opt{Cyan}
set-face global ts_constant_numeric %opt{Yellow}
set-face global ts_string %opt{Pink}
set-face global ts_string_regexp %opt{Cyan}
set-face global ts_string_special "%opt{Yellow}+Fu"
set-face global ts_comment %opt{Gray 90}
set-face global ts_variable %opt{Gray 120}
set-face global ts_variable_builtin "%opt{Coral}+F"
set-face global ts_variable_other_member %opt{Violet}
set-face global ts_label %opt{Yellow}
set-face global ts_keyword %opt{Cyan}
set-face global ts_function %opt{Yellow}
set-face global ts_function_macro %opt{Lime}
set-face global ts_function_builtin %opt{Lime}
set-face global ts_function_special %opt{Lime}
set-face global ts_tag %opt{Blue}
set-face global ts_special %opt{Lime}
set-face global ts_namespace %opt{Blue}
set-face global ts_markup_bold "+Fb"
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_markup_heading "%opt{Cyan}+Fb"
set-face global ts_markup_list_numbered %opt{Cyan}
set-face global ts_markup_list_unnumbered %opt{Cyan}
set-face global ts_markup_link_url "%opt{Pink}+Fiu"
set-face global ts_markup_link_text %opt{Cyan}
set-face global ts_markup_link_label %opt{Purple 20}
set-face global ts_markup_quote %opt{Pink}
set-face global ts_markup_raw %opt{Pink}
set-face global ts_markup_raw_inline %opt{Cyan}
set-face global ts_markup_raw_block rgb:EB83E2
set-face global ts_diff_plus %opt{Green 50}
set-face global ts_diff_minus %opt{Red 50}
set-face global ts_diff_delta %opt{Blue 80}