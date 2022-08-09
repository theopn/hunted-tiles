local awful = require("awful")

startup_app = { "clipit", "picom", "redshift -P -l 39.2:-86.5 -t 5600:3500 -m randr", }
startup_settings = { "xss-lock --transfer-sleep-lock -- ~/dotfiles/i3/i3_system_mode.sh lock --nofork",
                     "setxkbmap -option ctrl:swapcaps",
                     "xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1",
                     "xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Natural Scrolling Enabled' 1",
                   }
--{{{  Startup Applications
for _,v in ipairs(startup_app) do
  awful.spawn.with_shell(v)
end

for _,v in ipairs(startup_settings) do
  awful.spawn.with_shell(v)
end
-- }}}
