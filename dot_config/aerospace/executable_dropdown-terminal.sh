#!/bin/bash

TERMINAL_TITLE="QuickAccess Terminal"

TERMINAL_WORKSPACE_ID="T"


CURRENT_TERMINAL_ID=$(aerospace list-windows --all | grep "QuickAccess Terminal" | awk '{print $1}')

if [ $(echo "$CURRENT_TERMINAL_ID" | wc -l) -gt 1 ]; then
    echo "$CURRENT_TERMINAL_ID" | tail -n +2 | while read -r id; do
        aerospace close --window-id $id
        echo "Closed terminal with ID: $id"
    done
    sleep 0.5
fi
CURRENT_TERMINAL_ID=$(aerospace list-windows --all | grep "QuickAccess Terminal" | awk '{print $1}')
if [ -z "$CURRENT_TERMINAL_ID" ]; then
# Check if the terminal is already open
    CURRENT_FOCUS=$(aerospace list-windows --focused | awk '{print $1}')
    /Applications/Alacritty.app/Contents/MacOS/alacritty -T "$TERMINAL_TITLE" &
    timeout=5
    elapsed=0
    while [ -z "$CURRENT_TERMINAL_ID" ] && [ $elapsed -lt $timeout ]; do
        sleep 0.5
        elapsed=$((elapsed + 1))
        CURRENT_TERMINAL_ID=$(aerospace list-windows --all | grep "QuickAccess Terminal" | awk '{print $1}')
    done
    aerospace focus --window-id $CURRENT_TERMINAL_ID
    sleep 0.1
    /bin/bash -c 'open -g "raycast://extensions/raycast/window-management/top-two-thirds"'
    aerospace move-node-to-workspace $TERMINAL_WORKSPACE_ID --window-id $CURRENT_TERMINAL_ID
    aerospace focus --window-id $CURRENT_FOCUS
    aerospace layout floating --window-id $CURRENT_TERMINAL_ID
    aerospace resize width 1000 --window-id $CURRENT_TERMINAL_ID
    aerospace resize height 200 --window-id $CURRENT_TERMINAL_ID
fi


if [ "$1" == "toggle" ]; then
    CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)
    CURRENT_TERMINAL_ID=$(aerospace list-windows --all | grep "QuickAccess Terminal" | awk '{print $1}')
    echo "Current Terminal ID: $CURRENT_TERMINAL_ID"
    if [ -z $(aerospace list-windows --workspace $CURRENT_WORKSPACE --format %{window-id} | grep $CURRENT_TERMINAL_ID) ]; then
        aerospace move-node-to-workspace --window-id $CURRENT_TERMINAL_ID $CURRENT_WORKSPACE
        aerospace focus --window-id $CURRENT_TERMINAL_ID
        /bin/bash -c "~/.config/aerospace/center-floating.sh"
    else
        aerospace move-node-to-workspace --window-id $CURRENT_TERMINAL_ID $TERMINAL_WORKSPACE_ID
    fi
fi