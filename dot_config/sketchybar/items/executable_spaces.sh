#!/bin/bash

                              #icon="${SPACE_SIDS[sid]}"                                  \
#SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10) 
                              #icon=$sid              \
SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) 
SPACE_ICONS=("􀃊" "􀃌" "􀃎" "􀃐" "􀃒" "􀑵" "􀃖" "􀃘" "􀔲" "􀔳" "􀔴" "􀔵" "􀔶" "􀔷" "􀔸")
for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              icon.font="sketchybar-app-font:Regular:18.0" \
                              icon="${SPACE_ICONS[sid-1]}"               \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=20                     \
                              icon.padding_right=00                     \
                              label.y_offset=-1                          \
                              script="$PLUGIN_DIR/space.sh"              \
                              click_script="yabai -m space --focus $sid" \
            --subscribe space.$sid display_change

done

sketchybar --add item space_separator left                              \
           --set space_separator icon="􀆌"                                \
                                 label.font="sketchybar-app-font:Regular:18.0" \
                                 icon.color=$ACCENT_COLOR \
                                 icon.padding_left=4                   \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change                           
