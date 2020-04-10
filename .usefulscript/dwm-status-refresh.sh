#!/bin/bash

# emojis font search https://emojipedia.org/   or   https://getemoji.com/

export IDENTIFIER="unicode"
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
source "$DIR/dwmbar-functions/dwm_alsa.sh"
source "$DIR/dwmbar-functions/dwm_backlight.sh"
source "$DIR/dwmbar-functions/dwm_battery.sh"
source "$DIR/dwmbar-functions/dwm_date.sh"
source "$DIR/dwmbar-functions/dwm_network.sh"
source "$DIR/dwmbar-functions/dwm_resources.sh"

function get_bytes {
  # Find active network interface
  interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
  line=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
  eval $line
  now=$(date +%s%N)
}

function get_velocity {
  value=$1
  old_value=$2
  now=$3

  timediff=$(($now - $old_time))
  velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
  if test "$velKB" -gt 1024
  then
    echo $(echo "scale=2; $velKB/1024" | bc)MB/s
  else
    echo ${velKB}KB/s
  fi
}

# Get initial values
get_bytes
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

print_volume() {
  volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
  if test "$volume" -gt 0
  then
    echo -e "\uE05D${volume}"
  else
    echo -e "Mute"
  fi
}

get_bytes

# Calculates speeds
vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)

xsetroot -name " $(dwm_alsa) $(dwm_resources) $(dwm_network) 👆$vel_trans 👇$vel_recv $(dwm_date) $(dwm_backlight) $(dwm_battery) "

# Update old values to perform new calculations
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

exit 0
