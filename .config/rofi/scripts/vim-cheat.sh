#!/usr/bin/env bash
#
#   Usage:
#     1. Download Vim cheat sheet 
#        $ rofi-vim --download
#
#     2. Use dmenu to open the cheat sheet
#	 $ rofi-vim --dvim
#
#     3. Run it!
#        $ rofi-vim
#

# Where to save the cheat sheet.
VIM_FILE="$HOME/.cache/vimcheat.txt"

# Get current time
CURRENT_TIME=$(date +%s)

# Url of cheat sheet to download.
URL=('https://raw.githubusercontent.com/rdvm/rofi-vim/master/vimcheat')


function notify() {
    if [ "$(command -v notify-send)" ]; then
        notify-send "$1" "$2"
    fi
}


function download() {
    notify `basename "$0"` 'Downloading Vim cheat sheet'

    echo "" > "$VIM_FILE"

    # Echo URL to terminal and download the cheat sheet
    echo "Downloading: $URL"
    cheatsheet=$(curl -s "$URL")

    echo "$cheatsheet" >> "$VIM_FILE"

    notify `basename "$0"` "Cheat sheet downloaded"
}

# Download the cheat sheet if it doesn't exist or is older than 5 days
if [ ! -f "$VIM_FILE" ] || [ $((CURRENT_TIME - `stat -c %Y $VIM_FILE`)) -gt 432000 ]; then
    download
fi

function rvim() {
    sheet=$(cat "$VIM_FILE")
    line=$(echo "$sheet" | rofi -monitor -1 -dmenu -p "  command " -i -font "mono 23" -width 100 -location 0 -lines 15)
    exit_code=$?

    line=($line)
}

function dvim() {
    sheet=$(cat "$VIM_FILE")
    line=$(echo "$sheet" | dmenu -fn "mono 23" -p "vim command" -i -l 15) 
    exit_code=$?

    line=($line)
}

case $1 in
--download)
	download
	;;
--dvim)
	dvim
	;;
*)
	rvim
	;;
esac
