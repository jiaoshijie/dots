#!/usr/bin/bash

# sudo pacman -S trayer
result=$(ps ax|grep -v grep|grep trayer)
if [ "$result" == "" ]; then
  eval "trayer --edge top --align center --transparent true --tint 0x00000000 --iconspacing 7 --height 25 &"
else
  eval "killall trayer"
fi
