#!/usr/bin/env bash

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#set bash prompt
PS1="\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;32m\]@\[\033[1;34m\]\h \[\033[35m\]\w\[\033[1;31m\]]\[\033[0m\]$ \[\033[0m\]"
# NOTICE: for server
# PS1="\[\033[1;31m\][\[\[\033[1;34m\]\D{%F}\[\033[1;36m\]&\[\033[1;34m\]\t\[\033[1;32m\]@\033[1;33m\]\u:\[\033[35m\]\w\[\033[1;31m\]]\[\033[0m\]$ \[\033[0m\]"
HISTTIMEFORMAT="%y-%m-%d %H:%M:%S "
HISTFILE=~/.cache/bash_history

[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% --reverse --multi --info=inline --preview-window='right:hidden' --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || bat --style=numbers --color=always --line-range :500 {} 2> /dev/null' --bind='F2:toggle-preview'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

eval "$(zoxide init bash --cmd j)"
. "$HOME/.cargo/env"
