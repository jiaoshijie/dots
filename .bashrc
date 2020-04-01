#set bash prompt
# PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
PS1="\[\033[32m\]\w\[\033[1;33m\]$ \[\033[0m\]"

#for fcitx
export  GTK_IM_MODULE=fcitx
export  QT_IM_MODULE=fcitx
export  XMODIFIERS=@im=fcitx
export EDITOR='nvim'
export PATH=$PATH:~/.local/bin
export NUT=/home/red/"Nutstore Files"/Nutstore/
export TERM_ITALICS=true


export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#change ctrl caps key
# setxkbmap -option ctrl:swapcaps

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'

# for ipython
alias ipy='ipython --colors=Linux'

#for alias of git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gl='git log '
alias gh='git hist --all'
alias gc='git commit'
alias gd='git diff'
alias goto='git checkout '

alias c=clear
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
