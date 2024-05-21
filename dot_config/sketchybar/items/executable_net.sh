#!/bin/bash
sketchybar --add item net right                  \
           --set net script="$PLUGIN_DIR/net.sh" \
                     updates=on                  \
                     label.drawing=off           \
                     label.padding_left=0                  \
                     label.padding_right=0                \
                     icon.padding_left=4                  \
                     icon.padding_right=4       \
           --subscribe net wifi_change

