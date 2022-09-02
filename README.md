# Hunted Tiles

Hunted Tiles is a aspiring desktop environment built with [Awesome WM framework](https://awesomewm.org/) and other tools surrounding X11 window server to provide a simple yet powerful dynamic tiling window manager environment. The goal of the project is to reduce the number of dependencies and startup memory usage as much as possible while providing all the necessary tools and information to the user.

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
- Rofi: Pop-up launcher for window switching, app launcher, etc
- Vim: *Text editor*

## Widgets

- Awesome Menu
- CPU
- Memory
- Network
- Spotify status
- Volume
- Brightness
- Battery
- Clock
- Weather
- Do not disturb toggle

## Goal

- [ ] Clean and modifiable codebase
  - [ ] Consistent formatting, well documented
  - [ ] Minimal reliance on external script and maximum utilization Awesome API
  - [ ] Modifiable "header" file for default applications, layouts, settings, etc
- [ ] Sane keyboard shortcuts
  - [ ] Confirmation before quit or reload
- [ ] Consistent and simple widgets
  - [ ] Brightness & volume
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

