#!/bin/sh

dwm_gettitle() {
  printf "%s\n" "$(xdotool getactivewindow getwindowname)"
}

dwm_gettitle
