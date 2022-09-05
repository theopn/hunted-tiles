# Hunted Tiles

Hunted Tiles is a custom Linux window manager environment built with [Awesome WM framework](https://awesomewm.org/) and other tools surrounding the X11 window server. The goal of Hunted Tiles is a complete, lightweight, and aesthetically pleasing desktop environment that provides users freedom of dependency choice and an easily modifiable code base. The name “Hunted Tiles” was inspired by my favorite color scheme (and the main theme of Hunted Tiles), [Dracula](https://draculatheme.com), and the fact that AwesomeWM is a tiling WM.

## Aesthetics

The central theme of Hunted Tiles is heavily inspired by the [Dracula color palette](https://draculatheme.com/contribute). The artworks (wallpaper and the icon) were done by Naomi Lynn (thanks Naomi)!

## Screenshots

## Dependencies

### Core

- i3lock: Simple lock screen for X11
- setxkbmap: Map keyboard for X11
- xinput: Controls input hardware properties
- xss-lock: Controls behavior before suspend

### Convenience

- Clipit: Clipboard manager
- nm-applet: Network manager
- Picom: Compositor for X11
- Redshift: Nightlight filter

### Shortcut/Integration

- kitty: Terminal emulator
- Ranger: TUI file manager
- Rofi: Pop-up launcher for window switching, app launcher, etc.
- Vim: *Text editor*

## Widgets

- Awesome Menu
- CPU: From [awesome-wm-widgets repository](https://github.com/streetturtle/awesome-wm-widgets/tree/master/cpu-widget), displays a history chart with top processes.
- Memory: Since the CPU widget also contains memory information, the memory widget is kept very simple. Memory usage from the `free` command.
- Network: [net-widgets](https://github.com/pltanton/net_widgets) that are modified to focus on most laptop wireless modules.
- Spotify status: Grabs information from Python script that was inspired by [polybar-spotify](https://github.com/Jvanrhijn/polybar-spotify). Offers a little less functionality than the original widget, but it does not require a dependency other than `dbus` (and Python and Spotify I guess).
- Volume: Calculates the volume from PulseAudio `pactl` command. The widget is simple enough to support multiple audio mixers, and the support for `amixer` is coming.
- Brightness: Inspired by [awesome-wd-widgets brightness widget](https://github.com/streetturtle/awesome-wm-widgets/tree/master/brightness-widget), but modified to display accurate percentage when `brightnessctl` is used.
- Battery: Inner mechanism is from [battery widget by deficient](https://github.com/deficient/battery-widget), modified to fit the theme of Hunted Tiles.
- Clock: When clicked, a pop-up calendar is displayed.
- Weather: Grabs the text weather report from (wttr.in)[wttr.in].
- Do not disturb toggle: Pause the notification using the Awesome API module.

## User Customization

## Goal

- [ ] Clean and modifiable codebase
  - [ ] Consistent formatting, well documented
  - [ ] Minimal reliance on external script and maximum utilization Awesome API
  - [ ] Modifiable "header" file for default applications, layouts, settings, etc
- [ ] Sane keyboard shortcuts
  - [ ] Confirmation before quit or reload
- [ ] Consistent and simple widgets
  - [ ] Brightness, volume, battery
  - [ ] CPU, memory, temperature
  - [X] Network
  - [X] Calendar, weather, Spotify status
  - [ ] Do not disturb, Nightlight toggle, compositor toggle
  - [ ] Power menu (`awesome.quit()`, `awesome.restart()`)
  - [ ] Vim quick note access
- [ ] Integration and usable configuration for the default programs
  - [X] Rofi power menu
  - [ ] Vim quick note
  - [ ] Terminal emulator, TUI file browser
- [ ] Safe and clean installation script
