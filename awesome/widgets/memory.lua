local awful = require("awful")
local wibox = require("wibox")

return awful.widget.watch('bash -c "free -h | awk \'/^Mem/ {print $3}\'"', 15)
