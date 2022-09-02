local awful = require("awful")
local wibox = require("wibox")

local clock_widget = wibox.widget.textclock(" %a %m-%d %H:%M ", 10)

clock_widget:connect_signal("button::press",
  function()
    awful.spawn.with_shell("~/hunted-tiles//scripts/calendar_popup.sh")
  end
)

return clock_widget
