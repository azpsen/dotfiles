#!/bin/sh

# configure monitor position
exec /home/april/.screenlayout/samsung_aoc.sh

# set default cursor to standard arrow
xsetroot -cursor_name left_ptr

# restore color scheme
pywal -n -R

# set wallpaper
xwallpaper --zoom ~/wallpapers/jellyfish.jpg

exec bspwm
