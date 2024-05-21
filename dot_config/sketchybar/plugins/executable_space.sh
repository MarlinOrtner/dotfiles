#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh" # Loads all defined colors
if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=$ACCENT_COLOR \
                         label.color=$BAR_COLOR \
                         icon.color=$BAR_COLOR
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$ACCENT_COLOR \
                         icon.color=$ACCENT_COLOR
fi

display_len=$(yabai -m query --displays | jq -r ".[].id" |wc -l)
space_len=$(yabai -m query --spaces| jq -r ".[].id" |wc -l)
if [ $display_len -gt 1 ]; then
    if [ $space_len -lt 12 ]; then
        yabai -m space --create 2
        yabai -m space --create 2
        yabai -m space --create 2
        yabai -m space --create 2
        yabai -m space --create 2
    fi
    for idx in $(yabai -m query --spaces | jq '.[].index | select(. > 15)' | sort -nr); do
        yabai -m space --destroy "$idx"
    done


else
    for idx in $(yabai -m query --spaces | jq '.[].index | select(. > 10)' | sort -nr); do
        yabai -m space --destroy "$idx"
    done
fi


