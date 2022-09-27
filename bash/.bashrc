#!/usr/bin/env bash

function set_bash_prompt() {
  COLOR_NONE="\[\e[0m\]"
  RED="\[\e[1;31m\]"
  GREEN="\[\e[1;32m\]"
  YELLOW="\[\e[1;33m\]"
  BLUE="\[\e[1;34m\]"
  PINK="\[\e[1;35m\]"
  CYAN="\[\e[1;36m\]"

  BRANCH=''
  if git branch > /dev/null 2>&1; then
    # Note that for new repo without commit, git rev-parse --abbrev-ref HEAD will error out.
    if git rev-parse --abbrev-ref HEAD > /dev/null 2>&1; then
      BRANCH="${COLOR_NONE}(${CYAN}$(git rev-parse --abbrev-ref HEAD)${COLOR_NONE})"
    else
      BRANCH="${COLOR_NONE}()"
    fi
  fi

  PS1=""
  PS1+="${VIRTUAL_ENV_PROMPT}"
  PS1+="${RED}["
  PS1+="${YELLOW}\u"  # username
  PS1+="${GREEN}@"
  PS1+="${BLUE}\h "   # hostname
  PS1+="${PINK}\w"    # working directory
  PS1+="${RED}]"
  PS1+="${BRANCH}"
  # PS1+=" -> ${COLOR_NONE}(${BLUE}\D{%F}${GREEN}@${BLUE}\t${COLOR_NONE})\n"  # for server(display time)
  PS1+="${COLOR_NONE}$ "
}

export PROMPT_COMMAND=set_bash_prompt

# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="sh -c 'col -bx | nvim -R -c \"set ft=man\" -'"

HISTFILE=~/.cache/bash_history
HISTTIMEFORMAT="%y-%m-%d %H:%M:%S "

FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% --reverse --multi --info=inline"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
[ -f "/usr/share/fzf/key-bindings.bash" ] && source "/usr/share/fzf/key-bindings.bash"
[ -f "/usr/share/fzf/completion.bash" ] && source "/usr/share/fzf/completion.bash"

alias sudo="sudo -E"
alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias diff='diff --color -u'
alias rm="gio trash"
alias rml="gio trash --list"
alias rme="gio trash --empty"
alias ls='exa --group-directories-first'
alias ll='exa -lhg --group-directories-first'
alias l='exa -lhga --group-directories-first'
alias tree='exa --tree'
alias ldf="duf --only local"

alias hexedit="hexedit --color"
alias vi=vim
alias nv=nvim
alias sw=devour
alias btl=bluetoothctl
alias nlist="nmcli device wifi list"
alias nconn="nmcli device wifi connect"
alias SetProxy="source ~/dots/scripts/setTermProxy"
alias pc="env | grep --color=never proxy"

alias gs="git status"
alias gd="git diff"

eval "$(zoxide init bash --cmd j)"
