#!/bin/bash

if [ "$SENDER" = "space_windows_change" ]; then
  space="$(echo "$INFO" | jq -r '.space')"
  apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    done <<< "${apps}"
  sketchybar --set space.$space label="$icon_strip" label.drawing=true \
      icon.drawing=true icon.padding_right=4 icon.padding_left=5    \
      label.padding_right=20 label.padding_left=0

  else
    icon_strip=" -"
    sketchybar --set space.$space label.drawing=false icon.padding_left=5 icon.padding_right=10 icon.drawing=false
  fi
fi

. ~/.config/sketchybar/colors.sh
SID=$(yabai -m query --spaces --space | jq .index)
COUNT=$(yabai -m query --windows --space "$SID" | jq -r 'map(select(.app != "Enpass" and .app != "NordVPN")) | length')
if [ $COUNT = 1 ]; then
    borders inactive_color=0x00000000 active_color=0x00000000
else
    borders inactive_color=$BAR_COLOR_TRANS active_color=$ACCENT_COLOR
fi
#windows=$(echo $INFO |jq -r --arg SID "$SID" '. |select(.space==\"$SID\")' |jq '.apps |length')
#echo $INFO |jq -r '. | select(.space==$SID)' 
#COUNT=$(yabai -m query --windows --space "$SID" | jq -r '.|length')

#echo $INFO | jq -r '. |select(.space==$SID)'
#echo "$INFO" | jq -n --arg SID "$SID" -r '. |select(.space==($SID|tonumber))' 



