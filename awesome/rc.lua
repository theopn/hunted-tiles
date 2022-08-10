--[[
     _                                       __        ____  __
    / \__      ___By  ___ Theo  _ __ ___   __\ \      / /  \/  |
   / _ \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \ \ /\ / /| |\/| |
  / ___ \ V  V /  __/\__ \ (_) | | | | | |  __/\ V  V / | |  | |
/_/   \_\_/\_/ \___||___/\___/|_| |_| |_|\___| \_/\_/  |_|  |_|
--]]


-- {{{ Default Awesome libraries
pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
-- }}}

-- {{{ Error handling
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

---------------------
terminal = "kitty"
editor = "nvim" or "vi" or os.getenv("EDITOR")
editor_cmd = terminal .. " -e " .. editor

beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/dracula.lua")
require "layout"
require "menu"
require "wibar"
require "keybindings"
require "rules"
require "startup_app"
---------------------


-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

--{{{  Active window border
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus c.opacity = 1 end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal c.opacity = 0.8 end)
-- }}}


