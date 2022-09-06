local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

--{{{ Menu
local awesomeconfigmenu = {
  { "Restart", awesome.restart },
  { "Quit", function() awesome.quit() end },
}
mymainmenu = awful.menu({ items = { { "Danger", awesomeconfigmenu, beautiful.awesome_icon },
  { "Edit rc.lua", editor_cmd .. " " .. awesome.conffile },
  { "Hotkeys Help", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
}
})
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
  menu = mymainmenu })
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
  awful.button({}, 3, function() mymainmenu:toggle() end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))
-- }}}
