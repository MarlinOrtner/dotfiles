#!/usr/bin/env bash
. ~/.config/sketchybar/colors.sh
n=$(yabai -m query --spaces --space | jq '.windows | length')
if [ $n = 1 ]; then
    borders inactive_color=0x00000000 active_color=0x00000000 
else
    borders inactive_color=$BAR_COLOR_TRANS active_color=$ACCENT_COLOR 
fi
echo $INFO


. ~/.config/sketchybar/colors.sh
n=$(yabai -m query --spaces --space | jq '.windows | length')
if [ $n = 1 ]; then
    borders inactive_color=0x00000000 active_color=0x00000000
else
    borders inactive_color=$BAR_COLOR_TRANS active_color=$ACCENT_COLOR
fi
SID=$(yabai -m query --spaces --space | jq .index)
#windows=$(echo $INFO |jq -r --arg SID "$SID" '. |select(.space==\"$SID\")' |jq '.apps |length')
SID="1"
echo $INFO |jq -r '. | select(.space==\"SID\")' 
echo $INFO
