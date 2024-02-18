declare-option str background 'rgb:1C1C1C'
declare-option str foreground 'rgb:D0D0D0'
declare-option str regular0 'rgb:1C1C1C'
declare-option str regular1 'rgb:AF005F'
declare-option str regular2 'rgb:5FAF00'
declare-option str regular3 'rgb:D7AF5F'
declare-option str regular4 'rgb:5FAFD7'
declare-option str regular5 'rgb:808080'
declare-option str regular6 'rgb:D7875F'
declare-option str regular7 'rgb:D0D0D0'
declare-option str bright0 'rgb:585858'
declare-option str bright1 'rgb:5FAF5F'
declare-option str bright2 'rgb:AFD700'
declare-option str bright3 'rgb:AF87D7'
declare-option str bright4 'rgb:FFAF00'
declare-option str bright5 'rgb:FF5FAF'
declare-option str bright6 'rgb:00AFAF'
declare-option str bright7 'rgb:5F8787'
declare-option str selection_fg 'rgb:000000'
declare-option str selection_bg 'rgb:8787AF'
declare-option str selection_secondary_fg 'rgb:333333'
declare-option str selection_secondary_bg 'rgb:707097'
declare-option str special 'rgb:3E999F'
declare-option str cursorline_bg 'rgb:303030'
declare-option str cursorline_secondary_bg 'rgb:2A2A2A'
declare-option str cursorcolumn_bg 'rgb:303030'
declare-option str cursorcolumn_secondary_bg 'rgb:2A2A2A'
declare-option str cursorlinenr_fg 'rgb:FFFF00'
declare-option str popupmenu_fg 'rgb:C6C6C6'
declare-option str popupmenu_bg 'rgb:303030'
declare-option str linenumber_fg 'rgb:585858'
declare-option str vertsplit_fg 'rgb:5F8787'
declare-option str statusline_active_fg 'rgb:1C1C1C'
declare-option str statusline_active_bg 'rgb:5F8787'
declare-option str statusline_inactive_fg 'rgb:BCBCBC'
declare-option str statusline_inactive_bg 'rgb:3A3A3A'
declare-option str todo_fg 'rgb:FF8700'
declare-option str error_fg 'rgb:AF005F'
declare-option str error_bg 'rgb:5F0000'
declare-option str matchparen_bg 'rgb:4E4E4E'
declare-option str matchparen_fg 'rgb:C6C6C6'
declare-option str wildmenu_fg 'rgb:1C1C1C'
declare-option str wildmenu_bg 'rgb:AFD700'
declare-option str diffadd_fg 'rgb:87D700'
declare-option str diffadd_bg 'rgb:005F00'
declare-option str diffdelete_fg 'rgb:AF005F'
declare-option str diffdelete_bg 'rgb:5F0000'
declare-option str diffchange_bg 'rgb:005F5F'
declare-option str black 'rgb:1C1C1C'
declare-option str red 'rgb:AF005F'
declare-option str green 'rgb:5FAF00'
declare-option str yellow 'rgb:D7AF5F'
declare-option str blue 'rgb:5FAFD7'
declare-option str magenta 'rgb:808080'
declare-option str cyan 'rgb:D7875F'
declare-option str white 'rgb:D0D0D0'
declare-option str light_black 'rgb:585858'
declare-option str light_red 'rgb:5FAF5F'
declare-option str light_green 'rgb:AFD700'
declare-option str light_yellow 'rgb:AF87D7'
declare-option str light_blue 'rgb:FFAF00'
declare-option str light_magenta 'rgb:FF5FAF'
declare-option str light_cyan 'rgb:00AFAF'
declare-option str light_white 'rgb:5F8787'
set-face global ts_attribute %opt{bright4}
set-face global ts_type "%opt{bright2}+Fb"
set-face global ts_type_builtin "%opt{bright2}+Fb"
set-face global ts_type_enum_variant "%opt{foreground}+F"
set-face global ts_constructor %opt{foreground}
set-face global ts_constant %opt{bright5}
set-face global ts_constant_builtin_boolean "%opt{regular2}+Fb"
set-face global ts_constant_character_escape "%opt{bright3}+Fb"
set-face global ts_constant_character "%opt{regular3}+F"
set-face global ts_constant_numeric %opt{bright5}
set-face global ts_string %opt{regular3}
set-face global ts_string_regexp %opt{bright3}
set-face global ts_comment "%opt{regular5}+Fi"
set-face global ts_comment_line "%opt{regular5}+Fi"
set-face global ts_comment_block "%opt{regular5}+Fi"
set-face global ts_variable %opt{foreground}
set-face global ts_variable_builtin %opt{bright5}
set-face global ts_variable_other_member %opt{foreground}
set-face global ts_variable_parameter %opt{foreground}
set-face global ts_label "%opt{selection_bg}+Fbi"
set-face global ts_punctuation "%opt{foreground}+F"
set-face global ts_punctuation_delimiter "%opt{regular4}+Fb"
set-face global ts_punctuation_bracket "%opt{foreground}+F"
set-face global ts_punctuation_special "%opt{bright1}+Fb"
set-face global ts_keyword "%opt{bright2}+F"
set-face global ts_keyword_control %opt{bright1}
set-face global ts_keyword_control_conditional "%opt{bright3}+Fb"
set-face global ts_keyword_control_repeat "%opt{bright3}+Fb"
set-face global ts_keyword_control_import "%opt{bright2}+F"
set-face global ts_keyword_control_return "%opt{bright2}+F"
set-face global ts_keyword_control_exception "%opt{bright1}+F"
set-face global ts_keyword_operator "%opt{regular4}+Fb"
set-face global ts_keyword_directive %opt{regular4}
set-face global ts_keyword_function %opt{bright2}
set-face global ts_keyword_storage %opt{bright2}
set-face global ts_keyword_storage_type "%opt{regular4}+Fb"
set-face global ts_keyword_storage_modifier "%opt{regular6}+Fb"
set-face global ts_operator "%opt{regular4}+Fb"
set-face global ts_function "%opt{foreground}+F"
set-face global ts_function_builtin "%opt{bright6}+F"
set-face global ts_function_method "%opt{foreground}+F"
set-face global ts_function_macro "%opt{regular3}+Fb"
set-face global ts_function_special "%opt{bright4}+F"
set-face global ts_tag "%opt{regular4}+F"
set-face global ts_namespace %opt{bright6}
set-face global ts_special %opt{special}
set-face global ts_markup_heading "%opt{bright4}+Fb"
set-face global ts_markup_heading_marker "%opt{bright2}+Fb"
set-face global ts_markup_heading_1 "%opt{bright2}+Fb"
set-face global ts_markup_heading_2 "%opt{bright5}+Fb"
set-face global ts_markup_heading_3 "%opt{bright3}+Fb"
set-face global ts_markup_heading_4 "%opt{bright4}+Fb"
set-face global ts_markup_heading_5 "%opt{bright4}+Fb"
set-face global ts_markup_heading_6 "%opt{bright4}+Fb"
set-face global ts_markup_bold "%opt{foreground}+Fb"
set-face global ts_markup_italic "+Fi"
set-face global ts_markup_strikethrough "+Fs"
set-face global ts_markup_link_url "%opt{bright6}+F"
set-face global ts_markup_link_text %opt{bright2}
set-face global ts_markup_link_label "%opt{regular2}+Fb"
set-face global ts_markup_quote %opt{regular4}
set-face global ts_markup_raw %opt{regular3}
set-face global ts_diff_plus "%opt{diffadd_fg},%opt{diffadd_bg}+F"
set-face global ts_diff_delta ",%opt{diffchange_bg}+F"
set-face global ts_diff_delta_moved "+Fi"
set-face global ts_diff_minus "%opt{diffdelete_fg},%opt{diffdelete_bg}+F"