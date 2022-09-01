local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")

local dnd_text = wibox.widget {
  text = "   ",
  widget = wibox.widget.textbox
}

dnd_text:connect_signal("button::press",
  function()
    naughty.toggle()
    if (not naughty.is_suspended()) then
      awful.spawn.with_shell("notify-send 'Do Not Disturb Off'")
    end
  end
)

local dnd_widget = wibox.widget.background()
dnd_widget:set_widget(dnd_text)

return dnd_widget
