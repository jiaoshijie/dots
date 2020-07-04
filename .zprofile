export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/.local/bin:$GOPATH/bin:$HOME/.gem/ruby/2.7.0/bin
export ZDOTDIR="$HOME/.config/zsh"
export NUT=$HOME/"Nutstore Files"/Nutstore/
export TERM_ITALICS=true
export LC_TIME="zh_CN.UTF-8"

export EDITOR='nvim'
# export TERMINAL="st"
export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"

export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"


[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx > /dev/null 2>&1
