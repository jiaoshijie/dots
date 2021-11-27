#!/usr/bin/bash

# sudo pacman -S trayer
result=$(ps ax|grep -v grep|grep trayer)
if [ "$result" == "" ]; then
  eval "trayer --edge top --padding 10 --align center --distance 540 --transparent true --tint 0x00000000 --iconspacing 7 --heighttype request --widthtype request &"
else
  eval "killall trayer"
fi
