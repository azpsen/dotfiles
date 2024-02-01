#!/bin/bash

# icons cache file
ICONS_FILE="$HOME/.cache/nf-cheat.txt"

# url of icon sheet
URL="https://raw.githubusercontent.com/groovykiwi/rofi-nerdfont/master/nerd-font-cheatsheet.txt"

# get current time
CURRENT_TIME=$(date +%s)

# send notifications
function notify() {
    if [ "$(command -v notify-send)" ]; then
        notify-send "$1" "$2"
    fi
}

# download icons
function download() {
    notify `basename "$0"` 'downloading nerd-font icons list'

    echo "" > "$ICONS_FILE"

    # echo url to terminal and download the cheat sheet
    echo "Downloading: $URL"
    icons=$(curl -s "$URL")

    echo "$icons" >> "$ICONS_FILE"

    notify `basename "$0"` "icons downloaded"
}

# download icons file if it doesn't exist or is older than 5 days
if [ ! -f "$ICONS_FILE" ] || [ $((CURRENT_TIME - `stat -c %Y $ICONS_FILE`)) -gt 432000 ]; then
    download
fi

function rofinf() {
    icons=$(cat "$ICONS_FILE")
    line=$(echo "$icons" | rofi -monitor -1 -dmenu -p " 󰞅 nerd-font " -i -font "JetBrainsMonoNL Nerd Font Mono" -width 100 -location 0 -lines 15 -kb-accept-entry Return | cut -d" " -f2 | tr '\n' ' ' | sed 's/⠀//g; s/\s//g' | xclip -selection clipboard)
    exit_code=$?

    line=($line)
}

case $1 in
--download)
	download
	;;
--rofi)
  rofinf
	;;
esac

selection="$@"

if [ -z "$selection" ]
then
    readarray -t icons < "$ICONS_FILE"

    for icon in "${icons[@]}"; do
        echo "$icon"
    done
else
    coproc $(echo "$selection" | cut -d" " -f2 | tr '\n' ' ' | sed 's/⠀//g; s/\s//g' | xclip -selection clipboard)
    exit 0
fi
