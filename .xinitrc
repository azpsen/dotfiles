#!/bin/sh

# set default cursor to standard arrow
xsetroot -cursor_name left_ptr

# set wallpaper
xwallpaper --zoom ~/wallpapers/everforest/mist_forest_1.png

# start window manager
exec bspwm
