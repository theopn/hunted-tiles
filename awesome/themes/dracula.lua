---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")

local theme = {}

theme.font = "FantasqueSansMono Nerd Font 10"

theme.bg_normal   = "#282a36"
theme.bg_focus    = "#44475a"
theme.bg_urgent   = "#ff5555"
theme.bg_minimize = "#6272a4"
theme.bg_systray  = theme.bg_normal

theme.fg_normal   = "#8be9fd"
theme.fg_focus    = "#f8f8f2"
theme.fg_urgent   = "#f8f8f2"
theme.fg_minimize = "#f8f8f2"

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(1)
theme.border_normal = "#282a36"
theme.border_focus  = "#f1fa8c"
theme.border_marked = "#ff5555"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
  taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
  taglist_square_size, theme.fg_normal
)

-- notification_font
theme.notification_bg = "#282a36"
theme.notification_fg = "#f8f8f2"
theme.menu_height     = dpi(20)
theme.menu_width      = dpi(100)

theme.wallpaper = gfs.get_configuration_dir() .. "themes/wallpaper.png"

--[[ Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)
--]]
theme.awesome_icon        = gfs.get_configuration_dir() .. "themes/logo.png"
theme.awesome_icon_height = dpi(40)
theme.awesome_icon_width  = dpi(200)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
