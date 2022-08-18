local wibox = require("wibox")
local awful = require("awful")

volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")

local function update_volume(widget)
  local fd = io.popen("pactl get-sink-mute @DEFAULT_SINK@")
  local status = fd:read("*all")

  if (fd == nil or status == nil or status == "") then
    volume = " PulseAudio Error"
  elseif (status:find("yes")) then
    volume = " MUTED "
  else
    fd = io.popen("pactl get-sink-volume @DEFAULT_SINK@")
    status = fd:read("*all")
    -- Currently only get the "front-left" volume
    volume = status:match("%d+%s/%s+(%d+)") .. '% '
  end

  fd:close()

  widget:set_markup(volume)
end

update_volume(volume_widget)

mytimer = timer({ timeout = 1 })
mytimer:connect_signal("timeout", function() update_volume(volume_widget) end)
mytimer:start()

return volume_widget
