local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")

--- {{{ Widget List
local reverse_powerline = function(cr, width, height)
  gears.shape.powerline(cr, width + 5, height, -20)
end

local mycpu = require("widgets.cpu") {}
local mymemory = awful.widget.watch('bash -c "free -h | awk \'/^Mem/ {print $3}\'"', 15)

local myspotify = require("widgets.spotify")
local myvolume = require("widgets.volume")
local mybrightness = require("widgets.brightness") {
  type = "arc",
  program = "brightnessctl",
  step = 10,
  timeout = 1,
  percentage = true,
}
local mybrightness = require("widgets.brightness-test") {}
local mybattery = require("widgets.battery") {}
local net_widget = require("widgets.net-widgets.wireless") { interface = "wlp4s0", popup_position = "top_middle", }
--local net_widgets = require("net_widgets")
--net_wireless = net_widgets.wireless({interface="wlp1s0"})
local mytextclock = require("widgets.clock")
local myweather = require("widgets.weather")
local mydnd = require("widgets.do_not_disturb")
--}}}

-- {{{ Wibar
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        "request::activate",
        "tasklist",
        { raise = true }
      )
    end
  end),
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end))

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  awful.tag({ "1  ", "2  ", "3  ", "4  ", "5  ", "6  ", "7  ", "8  ", "9:  " }, s,
    awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.noempty,
    buttons = taglist_buttons,
    layout  = {
      spacing        = 12,
      spacing_widget = {
        color  = "#ff79c6",
        {
          forced_width = 5,
          shape        = gears.shape.circle,
          widget       = wibox.widget.separator,
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      layout         = wibox.layout.fixed.horizontal
    },
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    style   = {
      shape_border_width = 1,
      shape_border_color = '#777777',
      shape              = gears.shape.rounded_bar,
    },
    layout  = {
      spacing        = 10,
      spacing_widget = {
        {
          forced_width = 5,
          shape        = gears.shape.circle,
          widget       = wibox.widget.separator
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      layout         = wibox.layout.flex.horizontal
    },
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, opacity = 0.8, shape = gears.shape.rounded_bar, height = 33,
    stretch = true, border_width = 5, })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      spacing_widget = {
        color  = '#dddddd',
        shape  = gears.shape.bar,
        widget = wibox.widget.separator,
      },
      spacing = 12,

      layout = wibox.layout.fixed.horizontal,
      mylauncher,
      wibox.widget.systray(),
      mycpu,
      mymemory,
      net_widget,
      s.mytaglist,
      s.mypromptbox,
    },

    s.mytasklist,

    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      spacing_widget = {
        color  = '#dddddd',
        shape  = reverse_powerline,
        widget = wibox.widget.separator,
      },
      spacing = 16,

      wibox.widget.textbox(" "),
      myspotify,
      myvolume,
      mybrightness,
      mybattery,
      mytextclock,
      myweather,
      mydnd,
      s.mylayoutbox,
    },
  }
end)
-- }}}
