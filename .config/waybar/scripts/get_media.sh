#!/bin/bash

# Get media information
media=$(playerctl metadata -f "{{artist}} - {{title}}" | sed -e 's/&/\&amp;/g')
player_status=$(playerctl status)

# Getting position and duration
position=$(playerctl position)

# escape '&'
position_formatted=$(playerctl metadata --format '{{ duration(position) }}')
duration=$(playerctl metadata mpris:length --format '{{ duration(mpris:length) }}')

spotify_player=$(playerctl metadata -f "{{xesam:url}}" 2>/dev/null | grep -i spotify)
web_player=$(playerctl metadata -f "{{mpris:trackid}}" 2>/dev/null | grep -i firefox)

output=""

# Check if the media player is Spotify
if [[ -n "$spotify_player" ]]; then
    output="$media | $position_formatted / $duration"

# Check if the media player is a web player (e.g., Firefox)
elif [[ -n "$web_player" ]]; then
    output="  $media"

else
    # If not Spotify or a web player, show only title
    output="$player_status $media"
fi

if [[ $player_status = "Playing" ]]; then
    song_status=' '
elif [[ $player_status = "Paused" ]]; then
    song_status=' '
else
    song_status=''
fi

echo -e "$song_status $output"
