#!/bin/sh

dwm_gettitle() {
  printf "%s\n" "$(xdotool getactivewindow getwindowname)"
}

while true
do
  dwm_gettitle
  sleep 0.5
done
