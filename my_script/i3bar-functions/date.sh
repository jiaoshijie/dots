#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_date () {
    printf "%s" "$SEP1"
    printf "📅%s" "$(date "+%Y年%m月%d日 %A %T")"
    printf "%s\n" "$SEP2"
}

dwm_date
