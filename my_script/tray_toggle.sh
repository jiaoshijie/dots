#!/usr/bin/bash

# sudo pacman -S trayer or stalonetray

# tray_prog="trayer"
# tray_option="--edge top --padding 10 --align center --distance 540 --transparent true --tint 0x00000000 --iconspacing 7 --heighttype request --widthtype request"
# grep_prog="[t]rayer"

tray_prog="stalonetray"
tray_option="-t -i 50 --geometry 1x1+20+35 --no-shrink --slot-size 10"
grep_prog="[s]talonetray"

ifinstalled $tray_prog || exit

result=$(pgrep ^"$grep_prog"$)
if [[ "$result" == "" ]]; then
  eval "$tray_prog" "$tray_option" &
else
  eval "kill $result"
fi
