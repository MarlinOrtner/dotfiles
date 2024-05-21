#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

airpods_default=$(system_profiler SPAudioDataType | awk '/AirPods/{flag=1;next}/Default Output Device/{if(flag) print $0;flag=0}' | awk '{print $4}')




if [ "$SENDER" = "volume_change" ]; then
  VOLUME=$INFO

  case $VOLUME in
    [6-9][0-9]|100) ICON="􀊩"
    ;;
    [3-5][0-9]) ICON="􀊥"
    ;;
    [1-9]|[1-2][0-9]) ICON="􀊡"
    ;;
    *) ICON="􀊣"
  esac
    if [ "$airpods_default" = "Yes" ]; then
        ICON=$(echo "􀪷" $ICON)
    fi
  #sketchybar --set $NAME icon="$ICON" label="$VOLUME%"
  sketchybar --set $NAME icon="$ICON" 
fi
