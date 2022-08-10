local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

--{{{ Menu
myawesomemenu = {
 { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
 { "manual", terminal .. " -e man awesome" },
 { "edit config", editor_cmd .. " " .. awesome.conffile },
 { "restart", awesome.restart },
 { "quit", function() awesome.quit() end },
}
mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}
