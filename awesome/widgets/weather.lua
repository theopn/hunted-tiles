local awful = require("awful")
local wibox = require("wibox")

local weather_text = wibox.widget {
  text = " 摒  ",
  widget = wibox.widget.textbox
}

local weather_command = 'notify-send "$(curl "wttr.in/?0T")"'
weather_text:connect_signal("button::press",
  function()
    awful.spawn.with_shell(weather_command)
  end
)

local weather_widget = wibox.widget.background()
weather_widget:set_widget(weather_text)

return weather_widget
