#! /usr/bin/env sh

# fcitx5
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx

# fo 'go`
export GOPATH=$HOME/.local/go
export GO111MODULE=on

append_path () {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
  esac
}

append_path "$HOME/.local/bin"
append_path "$GOPATH/bin"
append_path "$HOME/.cargo/bin"
append_path "$HOME/dots/scripts/bin"

# time zone
export LC_TIME="zh_CN.UTF-8"

# qt theme
export QT_QPA_PLATFORMTHEME=qt5ct

export EDITOR='vim'
export TERMINAL="st"
export BROWSER="firefox"

# https://unix.stackexchange.com/questions/320465/new-tmux-sessions-do-not-source-bashrc-file
# if running bash
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx > /dev/null 2>&1
