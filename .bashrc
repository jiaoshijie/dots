#set bash prompt
# PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
PS1="\[\033[32m\]\w\[\033[1;33m\]$ \[\033[0m\]"

#for fcitx
export  GTK_IM_MODULE=fcitx
export  QT_IM_MODULE=fcitx
export  XMODIFIERS=@im=fcitx

#change ctrl caps key
# setxkbmap -option ctrl:swapcaps

#set bash vi mode
# set -o vi

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'

# for ipython
alias ipy='ipython qtconsole --pylab=inline --colors=Linux'

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
