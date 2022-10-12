#!/usr/bin/env bash

if [[ -n "$BASH_VERSION" ]]; then
    # include .bashrc if it exists
    if [[ -f "$HOME/.bashrc" ]]; then
        # NOTE: don't warn me
        # shellcheck source=/dev/null
        . "$HOME/.bashrc"
    fi
fi

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx > /dev/null 2>&1
