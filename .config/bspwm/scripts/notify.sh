#!/bin/bash

previous_track=""
while true; do
    # Check if feishin player exists
    player_exists=$(playerctl --player=Feishin status > /dev/null 2>&1; echo $?)
    if (( player_exists != 0 )); then
        sleep 1
        continue
    fi
    
    status=$(playerctl -p Feishin status)
    if [[ x"$status" == x"Stopped" ]]; then
        sleep 1
        continue
    fi
    current_track=$(playerctl -p Feishin metadata --format '<i>{{ title }}</i>\n{{ artist }}\n{{ album }}')
    album_art_url=$(playerctl -p Feishin metadata mpris:artUrl)
    album_art_file="/tmp/album_art.jpg"
    wget -q -O $album_art_file $album_art_url
    if [[ "$current_track" != "$previous_track" ]]; then
        notify-send "now playing" "$current_track" -i $album_art_file
        previous_track="$current_track"
    fi
    sleep 1
done
