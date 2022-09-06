local awful = require("awful")

awful.layout.layouts = {
  awful.layout.suit.tile, --> One main window on the left, rest are tiling on the right
  awful.layout.suit.tile.left, --> Tile but main is one the right
  --awful.layout.suit.tile.bottom, --> Tile but main is on the top
  --awful.layout.suit.tile.top, --> Tile but main is on the bottom
  awful.layout.suit.fair, --> Four windows divide screen evenly, can't resize
  --awful.layout.suit.fair.horizontal, --> Same as fair, but two windows are horizontally placed
  awful.layout.suit.floating, --> Floating
  --awful.layout.suit.magnifier, --> One floating window on the top
  --awful.layout.suit.corner.nw, --> Main window on the top left, other's surrounding it
  --awful.layout.suit.corner.ne,
  --awful.layout.suit.corner.sw,
  --awful.layout.suit.corner.se,
  --awful.layout.suit.spiral, --> Big window on the right, smaller on the top left, even smaller on bottom left, etc
  --awful.layout.suit.spiral.dwindle, --> Spiral that is not spiral looking
  --awful.layout.suit.max, --> Max
  --awful.layout.suit.max.fullscreen, --> Most annoying one, just use Super + f
}
