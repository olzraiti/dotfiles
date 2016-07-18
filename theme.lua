----------------------------------------------------
--  "Peura" awesome theme                         --
--  By Olli Raitio                                -- 
--  Image files are from zenburn theme.           -- 
----------------------------------------------------

theme_path = os.getenv("HOME") .. "/.config/awesome/themes/peura/"
config_path = os.getenv("HOME") .. "/.config/awesome/"

-- {{{ Main
theme = {}

theme.wallpaper = os.getenv("HOME") .. "/SparkleShare/sparkleshark/wallpaper"-- }}}

-- {{{ Styles
theme.font      = "terminus (ttf), normal 9"

-- {{{ Colors
theme.fg_normal  = "#FFF5BA"
theme.fg_focus   = theme.fg_normal
theme.fg_urgent  = "#BF5C96"
theme.bg_normal  = "#20201F"
theme.bg_focus   = "#D46161"
theme.bg_urgent  = "#5CBF85"

theme.bg_widgets = {
	"#4C614B",
	"#4E7A43",
	"#598F3D",
	"#7AAB32",
	"#ab9032",
	"#ab7632",
	"#0AFF2B"
}
-- Systray's bg can't be overwritten. If you example have systray as 3rd widget, set this to theme.bg_widgets[3]
theme.bg_systray = theme.bg_widgets[1]

theme.fg_widget = theme.fg_normal 
-- }}} 
-- {{{ Borders
theme.border_width  = 0

--Set this to your gtk-theme's background color
theme.border_normal = "#363d43"
theme.border_focus  = theme.bg_focus
theme.border_marked = "#CC9393"
-- }}}


theme.titlebar_bg_focus  = "#00474F"
theme.titlebar_bg_normal = "#FF473D"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_fg_normal = "#00B3CF"
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_focus = theme.bg_focus
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = theme_path .. "taglist/squarefz.png"
theme.taglist_squares_unsel = theme_path .."taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = theme_path .. "awesome-icon.png"
theme.menu_submenu_icon      = theme_path .. "submenu.png"
-- }}}

theme.useless_gap_width = 20

-- {{{ Titlebar
theme.titlebar_close_button_focus  = theme_path .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme_path .. "titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = theme_path .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme_path .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme_path .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme_path .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme_path .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme_path .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme_path .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme_path .. "titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
