#!/bin/sh

# set default cursor to standard arrow
xsetroot -cursor_name left_ptr

# set wallpaper
xwallpaper --zoom ~/wallpapers/city.png

# start window manager
exec bspwm
