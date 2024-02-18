# palette
declare-option str background 'rgb:EEEEEE'
declare-option str foreground 'rgb:444444'
declare-option str regular0 'rgb:EEEEEE'
declare-option str regular1 'rgb:AF0000'
declare-option str regular2 'rgb:008700'
declare-option str regular3 'rgb:5F8700'
declare-option str regular4 'rgb:0087AF'
declare-option str regular5 'rgb:878787'
declare-option str regular6 'rgb:005F87'
declare-option str regular7 'rgb:444444'
declare-option str bright0 'rgb:BCBCBC'
declare-option str bright1 'rgb:D70000'
declare-option str bright2 'rgb:D70087'
declare-option str bright3 'rgb:8700AF'
declare-option str bright4 'rgb:D75F00'
declare-option str bright5 'rgb:D75F00'
declare-option str bright6 'rgb:005FAF'
declare-option str bright7 'rgb:005F87'
declare-option str selection_fg 'rgb:EEEEEE'
declare-option str selection_bg 'rgb:0087AF'
declare-option str selection_secondary_fg 'rgb:D9D7D7'
declare-option str selection_secondary_bg 'rgb:2C687A'
declare-option str special 'rgb:3E999F'
declare-option str cursorline_bg 'rgb:E4E4E4'
declare-option str cursorline_secondary_bg 'rgb:EAEAEA'
declare-option str cursorcolumn_bg 'rgb:E4E4E4'
declare-option str cursorcolumn_secondary_bg 'rgb:EAEAEA'
declare-option str cursorlinenr_fg 'rgb:AF5F00'
declare-option str popupmenu_fg 'rgb:444444'
declare-option str popupmenu_bg 'rgb:D0D0D0'
declare-option str linenumber_fg 'rgb:B2B2B2'
declare-option str vertsplit_fg 'rgb:005F87'
declare-option str statusline_active_fg 'rgb:E4E4E4'
declare-option str statusline_active_bg 'rgb:005F87'
declare-option str statusline_inactive_fg 'rgb:444444'
declare-option str statusline_inactive_bg 'rgb:D0D0D0'
declare-option str todo_fg 'rgb:00AF5F'
declare-option str error_fg 'rgb:AF0000'
declare-option str error_bg 'rgb:FFD7FF'
declare-option str matchparen_bg 'rgb:C6C6C6'
declare-option str matchparen_fg 'rgb:005F87'
declare-option str wildmenu_fg 'rgb:444444'
declare-option str wildmenu_bg 'rgb:FFFF00'
declare-option str diffadd_fg 'rgb:008700'
declare-option str diffadd_bg 'rgb:AFFFAF'
declare-option str diffdelete_fg 'rgb:AF0000'
declare-option str diffdelete_bg 'rgb:FFD7FF'
declare-option str diffchange_bg 'rgb:FFD787'
declare-option str black 'rgb:EEEEEE'
declare-option str red 'rgb:D70000'
declare-option str green 'rgb:008700'
declare-option str yellow 'rgb:5F8700'
declare-option str blue 'rgb:0087AF'
declare-option str magenta 'rgb:878787'
declare-option str cyan 'rgb:005F87'
declare-option str white 'rgb:444444'
declare-option str light_black 'rgb:BCBCBC'
declare-option str light_red 'rgb:D70000'
declare-option str light_green 'rgb:D70087'
declare-option str light_yellow 'rgb:8700AF'
declare-option str light_blue 'rgb:D75F00'
declare-option str light_magenta 'rgb:D75F00'
declare-option str light_cyan 'rgb:4C7A4D'
declare-option str light_white 'rgb:005FAF'

# kak-tree-sitter
set-face global ts_attribute %opt{bright4}
set-face global ts_comment "%opt{regular5}+Fi"
set-face global ts_comment_block "%opt{regular5}+Fi"
set-face global ts_comment_line "%opt{regular5}+Fi"
set-face global ts_constant %opt{bright5}
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean "%opt{regular2}+Fb"
set-face global ts_constant_character "%opt{regular3}+F"
set-face global ts_constant_character_escape "%opt{bright3}+Fb"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric %opt{bright5}
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor %opt{foreground}
set-face global ts_diff_delta ",%opt{diffchange_bg}+F"
set-face global ts_diff_delta_moved "+Fi"
set-face global ts_diff_minus "%opt{diffdelete_fg},%opt{diffdelete_bg}+F"
set-face global ts_diff_plus "%opt{diffadd_fg},%opt{diffadd_bg}+F"
set-face global ts_function "%opt{foreground}+F"
set-face global ts_function_builtin "%opt{bright6}+F"
set-face global ts_function_macro "%opt{regular3}+Fb"
set-face global ts_function_method "%opt{foreground}+F"
set-face global ts_function_special "%opt{bright4}+F"
set-face global ts_keyword "%opt{bright2}+F"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control %opt{bright1}
set-face global ts_keyword_control_conditional "%opt{bright3}+Fb"
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception "%opt{bright1}+F"
set-face global ts_keyword_control_import "%opt{bright2}+F"
set-face global ts_keyword_control_repeat "%opt{bright3}+Fb"
set-face global ts_keyword_control_return "%opt{bright2}+F"
set-face global ts_keyword_directive %opt{regular4}
set-face global ts_keyword_function %opt{bright2}
set-face global ts_keyword_operator "%opt{regular4}+Fb"
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage %opt{bright2}
set-face global ts_keyword_storage_modifier "%opt{regular6}+Fb"
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type "%opt{regular4}+Fb"
set-face global ts_label "%opt{selection_bg}+Fbi"
set-face global ts_markup_bold "%opt{foreground}+Fb"
set-face global ts_markup_heading "%opt{bright4}+Fb"
set-face global ts_markup_heading_1 "%opt{bright2}+Fb"
set-face global ts_markup_heading_2 "%opt{bright5}+Fb"
set-face global ts_markup_heading_3 "%opt{bright3}+Fb"
set-face global ts_markup_heading_4 "%opt{bright4}+Fb"
set-face global ts_markup_heading_5 "%opt{bright4}+Fb"
set-face global ts_markup_heading_6 "%opt{bright4}+Fb"
set-face global ts_markup_heading_marker "%opt{bright2}+Fb"
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label "%opt{regular2}+Fb"
set-face global ts_markup_link_text %opt{bright2}
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "%opt{bright6}+F"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote %opt{regular4}
set-face global ts_markup_raw %opt{regular3}
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline ts_markup_raw
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_namespace %opt{bright6}
set-face global ts_operator "%opt{regular4}+Fb"
set-face global ts_punctuation "%opt{foreground}+F"
set-face global ts_punctuation_bracket "%opt{foreground}+F"
set-face global ts_punctuation_delimiter "%opt{regular4}+Fb"
set-face global ts_punctuation_special "%opt{bright1}+Fb"
set-face global ts_special %opt{special}
set-face global ts_string %opt{regular3}
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp %opt{bright3}
set-face global ts_string_special ts_string
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "%opt{regular4}+F"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "%opt{bright2}+Fb"
set-face global ts_type_builtin "%opt{bright2}+Fb"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant "%opt{foreground}+F"
set-face global ts_variable %opt{foreground}
set-face global ts_variable_builtin %opt{bright5}
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member %opt{foreground}
set-face global ts_variable_parameter %opt{foreground}