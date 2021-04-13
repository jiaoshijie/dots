#!/usr/bin/env sh

# xdg-open "$1"

while true; do
  for i in "$@"; do
    mpv "$i"
  done
done
