#!/usr/bin/env sh

. "$CONFIG_DIR/resources.sh"

# When switching between devices, it's possible to get hit with multiple
# concurrent events, some of which may occur before `scutil` picks up the
# changes, resulting in race conditions.
sleep 1

services=$(networksetup -listnetworkserviceorder)
device=$(route get example.com | grep interface | awk '{print $2}')
if [ -z "$device" ]
then 
    device=$(scutil --nwi | sed -n "s/.*Network interfaces: \([^,]*\).*/\1/p" | awk '{print $1}')
fi

test -n "$device" && service=$(echo "$services" \
  | sed -n "s/.*Hardware Port: \([^,]*\), Device: $device.*/\1/p")


vpns=$(scutil --nc list | grep "Connected")
test -n "$vpns" && nordvpn=$(echo "$vpns" | grep "NordVPN NordLynx")

color=$FG1



if [ -z "$nordvpn" ]
then
    case $service in
          "USB 10/100/1000 LAN")    icon=$NET_ETHER;;
          "iPhone USB")         icon=$NET_USB;;
          "Thunderbolt Bridge") icon=$NET_THUNDERBOLT;;

          Wi-Fi)
            ssid=$(networksetup -getairportnetwork "$device" \
              | sed -n "s/Current Wi-Fi Network: \(.*\)/\1/p")
            case $ssid in
              *iPhone*) icon=$NET_HOTSPOT;;
              "")       icon=$NET_DISCONNECTED; color=$FG1;;
              *)        icon=$NET_WIFI;;
            esac;;

          *)
            wifi_device=$(echo "$services" \
              | sed -n "s/.*Hardware Port: Wi-Fi, Device: \([^\)]*\).*/\1/p")
            test -n "$wifi_device" && status=$( \
              networksetup -getairportpower "$wifi_device" | awk '{print $NF}')
            icon=$(test "$status" = On && echo "$NET_DISCONNECTED" || echo "$NET_OFF")
            color=$FG2;;
        esac


else
    icon=$NET_VPN

    fi

sketchybar --animate sin 5 --set "$NAME" icon="$icon" icon.color="$color" label.drawing=off icon.align=center

