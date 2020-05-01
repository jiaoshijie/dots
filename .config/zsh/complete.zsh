#自动补全功能
setopt auto_list
setopt auto_menu
# setopt completealiases

autoload -U compinit
compinit
zstyle ':completion:*' rehash true
# _comp_options+=(globdots) # Include hidden files

#Completion Options
zstyle ':completion:*' menu select
zstyle ':completion:*' force-list always

zmodload zsh/complist

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
