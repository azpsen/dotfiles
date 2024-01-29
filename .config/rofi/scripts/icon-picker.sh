#!/bin/bash

# Run Rofi with the nerd-font-cheat script as the source for the modi
rofi -modi "nerdfont:~/.config/rofi/scripts/nerd-fonts.sh,emoji" -show nerdfont -emoji-mode copy -monitor -1

# Copy the selected icon to the clipboard
# echo "$selected_icon" | xclip -selection clipboard

