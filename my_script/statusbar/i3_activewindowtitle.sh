#!/bin/sh

i3_gettitle() {
  printf "🌟%s\n" "$(xdotool getactivewindow getwindowname)"
}

while true
do
  i3_gettitle
  sleep 0.5
done
