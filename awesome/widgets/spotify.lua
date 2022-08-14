local awful = require("awful")
local wibox = require("wibox")

local spotify_text = wibox.widget {
  text = "   ",
  widget = wibox.widget.textbox
}

local spotify_command = 'notify-send "$(~/myawesomeconfig/scripts/spotify_status.py)"'
spotify_text:connect_signal("button::press",
  function()
    awful.spawn.with_shell(spotify_command)
  end
)

local spotify_widget = wibox.widget.background()
spotify_widget:set_widget(spotify_text)

return spotify_widget
