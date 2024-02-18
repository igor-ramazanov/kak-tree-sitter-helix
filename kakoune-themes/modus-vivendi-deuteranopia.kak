# palette
declare-option str bg_main 'rgb:000000'
declare-option str bg_dim 'rgb:1E1E1E'
declare-option str fg_main 'rgb:FFFFFF'
declare-option str fg_dim 'rgb:989898'
declare-option str fg_alt 'rgb:C6DAFF'
declare-option str bg_active 'rgb:535353'
declare-option str bg_inactive 'rgb:303030'
declare-option str border 'rgb:646464'
declare-option str red 'rgb:FF5F59'
declare-option str red_warmer 'rgb:FF6B55'
declare-option str red_cooler 'rgb:FF7F9F'
declare-option str red_faint 'rgb:FF9580'
declare-option str red_intense 'rgb:FF5F5F'
declare-option str green 'rgb:44BC44'
declare-option str green_warmer 'rgb:70B900'
declare-option str green_cooler 'rgb:00C06F'
declare-option str green_faint 'rgb:88CA9F'
declare-option str green_intense 'rgb:44DF44'
declare-option str yellow 'rgb:CABF00'
declare-option str yellow_warmer 'rgb:FFA00F'
declare-option str yellow_cooler 'rgb:D8AF7A'
declare-option str yellow_faint 'rgb:D2B580'
declare-option str yellow_intense 'rgb:EFEF00'
declare-option str blue 'rgb:2FAFFF'
declare-option str blue_warmer 'rgb:79A8FF'
declare-option str blue_cooler 'rgb:00BCFF'
declare-option str blue_faint 'rgb:82B0EC'
declare-option str blue_intense 'rgb:338FFF'
declare-option str magenta 'rgb:FEACD0'
declare-option str magenta_warmer 'rgb:F78FE7'
declare-option str magenta_cooler 'rgb:B6A0FF'
declare-option str magenta_faint 'rgb:CAA6DF'
declare-option str magenta_intense 'rgb:FF66FF'
declare-option str cyan 'rgb:00D3D0'
declare-option str cyan_warmer 'rgb:4AE2F0'
declare-option str cyan_cooler 'rgb:6AE4B9'
declare-option str cyan_faint 'rgb:9AC8E0'
declare-option str cyan_intense 'rgb:00EFF0'
declare-option str rust 'rgb:DB7B5F'
declare-option str gold 'rgb:C0965B'
declare-option str olive 'rgb:9CBD6F'
declare-option str slate 'rgb:76AFBF'
declare-option str indigo 'rgb:9099D9'
declare-option str maroon 'rgb:CF7FA7'
declare-option str pink 'rgb:D09DC0'
declare-option str bg_red_intense 'rgb:9D1F1F'
declare-option str bg_green_intense 'rgb:2F822F'
declare-option str bg_yellow_intense 'rgb:7A6100'
declare-option str bg_blue_intense 'rgb:1640B0'
declare-option str bg_magenta_intense 'rgb:7030AF'
declare-option str bg_cyan_intense 'rgb:2266AE'
declare-option str bg_red_subtle 'rgb:620F2A'
declare-option str bg_green_subtle 'rgb:00422A'
declare-option str bg_yellow_subtle 'rgb:4A4000'
declare-option str bg_blue_subtle 'rgb:242679'
declare-option str bg_magenta_subtle 'rgb:552F5F'
declare-option str bg_cyan_subtle 'rgb:004065'
declare-option str bg_red_nuanced 'rgb:2C0614'
declare-option str bg_green_nuanced 'rgb:001904'
declare-option str bg_yellow_nuanced 'rgb:221000'
declare-option str bg_blue_nuanced 'rgb:0F0E39'
declare-option str bg_magenta_nuanced 'rgb:230631'
declare-option str bg_cyan_nuanced 'rgb:041529'
declare-option str bg_ochre 'rgb:442C2F'
declare-option str bg_lavender 'rgb:38325C'
declare-option str bg_sage 'rgb:0F3D30'
declare-option str bg_completion 'rgb:2F447F'
declare-option str bg_hover 'rgb:45605E'
declare-option str bg_hover_secondary 'rgb:654A39'
declare-option str bg_hl_line 'rgb:2F3849'
declare-option str bg_region 'rgb:5A5A5A'
declare-option str fg_region 'rgb:FFFFFF'
declare-option str bg_char_0 'rgb:0050AF'
declare-option str bg_char_1 'rgb:7F1F7F'
declare-option str bg_char_2 'rgb:625A00'
declare-option str bg_mode_line_active 'rgb:2A2A6A'
declare-option str fg_mode_line_active 'rgb:F0F0F0'
declare-option str border_mode_line_active 'rgb:8080A7'
declare-option str bg_mode_line_inactive 'rgb:2D2D2D'
declare-option str fg_mode_line_inactive 'rgb:969696'
declare-option str border_mode_line_inactive 'rgb:606060'
declare-option str modeline_err 'rgb:E5BF00'
declare-option str modeline_warning 'rgb:C0CF35'
declare-option str modeline_info 'rgb:ABEADF'
declare-option str bg_tab_bar 'rgb:313131'
declare-option str bg_tab_current 'rgb:000000'
declare-option str bg_tab_other 'rgb:545454'
declare-option str bg_added 'rgb:003066'
declare-option str bg_added_faint 'rgb:001A4F'
declare-option str bg_added_refine 'rgb:0F4A77'
declare-option str bg_added_fringe 'rgb:006FFF'
declare-option str fg_added 'rgb:C4D5FF'
declare-option str fg_added_intense 'rgb:8080FF'
declare-option str bg_changed 'rgb:2F123F'
declare-option str bg_changed_faint 'rgb:1F022F'
declare-option str bg_changed_refine 'rgb:3F325F'
declare-option str bg_changed_fringe 'rgb:7F55A0'
declare-option str fg_changed 'rgb:E3CFFF'
declare-option str fg_changed_intense 'rgb:CF9FE2'
declare-option str bg_removed 'rgb:3D3D00'
declare-option str bg_removed_faint 'rgb:281F00'
declare-option str bg_removed_refine 'rgb:555500'
declare-option str bg_removed_fringe 'rgb:D0C03F'
declare-option str fg_removed 'rgb:D4D48F'
declare-option str fg_removed_intense 'rgb:D0B05F'
declare-option str bg_diff_context 'rgb:1A1A1A'
declare-option str bg_paren_match 'rgb:2F7F9F'
declare-option str bg_paren_expression 'rgb:453040'

# kak-tree-sitter
set-face global ts_attribute %opt{cyan_cooler}
set-face global ts_comment %opt{yellow_cooler}
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant %opt{blue_cooler}
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character ts_constant
set-face global ts_constant_character_escape magenta
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric ts_constant
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor %opt{cyan_cooler}
set-face global ts_diff_delta "%opt{fg_changed},%opt{bg_changed}+F"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "%opt{fg_removed},%opt{bg_removed}+F"
set-face global ts_diff_plus "%opt{fg_added},%opt{bg_added}+F"
set-face global ts_function magenta
set-face global ts_function_builtin ts_function
set-face global ts_function_macro %opt{magenta_warmer}
set-face global ts_function_method ts_function
set-face global ts_function_special ts_function
set-face global ts_keyword %opt{magenta_cooler}
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control ts_keyword
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive %opt{red_cooler}
set-face global ts_keyword_function ts_keyword
set-face global ts_keyword_operator ts_keyword
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage ts_keyword
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label %opt{fg_dim}
set-face global ts_markup_bold "+Fb"
set-face global ts_markup_heading ts_markup
set-face global ts_markup_heading_1 "%opt{fg_main}+Fb"
set-face global ts_markup_heading_2 "%opt{yellow_faint}+Fb"
set-face global ts_markup_heading_3 "%opt{fg_alt}+Fb"
set-face global ts_markup_heading_4 "magenta+Fb"
set-face global ts_markup_heading_5 "%opt{green_faint}+Fb"
set-face global ts_markup_heading_6 "%opt{red_faint}+Fb"
set-face global ts_markup_heading_marker %opt{fg_dim}
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text "%opt{blue_warmer}+Fu"
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "cyan+F"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked "%opt{yellow_warmer}+F"
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked "%opt{yellow_warmer}+F"
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote ts_markup
set-face global ts_markup_raw ts_markup
set-face global ts_markup_raw_block ",%opt{bg_dim}+F"
set-face global ts_markup_raw_inline "%opt{green_cooler}+F"
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_namespace %opt{blue_cooler}
set-face global ts_punctuation %opt{fg_dim}
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter ts_punctuation
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special %opt{red_cooler}
set-face global ts_string %opt{blue_warmer}
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp %opt{magenta_faint}
set-face global ts_string_special %opt{blue_faint}
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag magenta
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type %opt{cyan_cooler}
set-face global ts_type_builtin ts_type
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant ts_type_enum
set-face global ts_variable_builtin %opt{magenta_cooler}
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member ts_variable_other
set-face global ts_variable_parameter cyan