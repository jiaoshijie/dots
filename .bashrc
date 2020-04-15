#set bash prompt
# PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
PS1="\[\033[32m\]\w\[\033[1;33m\]$ \[\033[0m\]"

# export http_proxy=''
# export https_proxy=''
# export ftp_proxy=''
# export socks_proxy=''

#change ctrl caps key
# setxkbmap -option ctrl:swapcaps

[ -f ~/.aliasrc ] && source ~/.aliasrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
