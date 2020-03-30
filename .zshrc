export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export ZSH=/usr/share/oh-my-zsh
export EDITOR='nvim'
export PATH=$PATH:~/.local/bin:/home/red/.gem/ruby/2.6.0/bin
export NUT=/home/red/"Nutstore Files"/Nutstore/
export TERM_ITALICS=true


# ZSH_THEME="ys"
ZSH_THEME="simple"


DISABLE_AUTO_UPDATE="true"

HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)  # vi-mode

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

########################
#自己定义的设置

# vi-mode
# export KEYTIMEOUT=1

# # Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'

#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select

# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init

# # Use beam shape cursor on startup.
# echo -ne '\e[5 q'
# # Use beam shape cursor for each new prompt.
# preexec() { echo -ne '\e[5 q' ;}

# alias-keys
# git clone https://github.com/kaelzhang/shell-safe-rm.git
alias rm="~/.local/bin/shell-safe-rm/bin/rm.sh"
# alias update="sudo pacman -Syu"
# alias cclean="sudo pacman -Scc"
# alias install="sudo pacman -S"
# alias remove="sudo pacman -Rcn"
# alias removeloop="sudo pacman -R $(pacman -Qdtq) 2> /dev/null"

alias SetProxy="export http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118"
alias UnSetProxy="unset http_proxy https_proxy"
alias lsvideo="lspci | egrep 'VGA|3D'"
alias nvidiainfo="nvidia-smi"
alias nvidiaup="sudo tee /proc/acpi/bbswitch <<< 'ON'"
alias s=neofetch
alias p="ping www.baidu.com"
alias c=clear
alias x="xmodmap ~/.Xmodmap"
# alias wgu="sudo wg-quick up wg0"
# alias wgd="sudo wg-quick down wg0"
alias hexedit="hexedit --color"
alias ntmux="tmux new -s"
alias atmux="tmux a -t"
alias tJ="tmux new -s jie || tmux a -t jie -d"
alias te="tmux new -s SUN || tmux a -t SUN -d"
alias fm=ranger
alias ipy=ipython
alias supiplocal="sudo pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ "
alias piplocal="pip install --user -i https://pypi.tuna.tsinghua.edu.cn/simple/ "
alias sunpm="sudo npm --registry https://registry.npm.taobao.org install -g"

# 以终端的形式运行emacs
alias Emacs="emacs -nw"

# git alias
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gd="git diff"
alias goto="git checkout"
alias gl="git log --graph"
alias guntrack="git rm -r --cached "
alias githist="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias gittype="git cat-file -t "
alias gitdump="git cat-file -p "

if [ -f ~/.ssh/ssh_connection ]; then
  source ~/.ssh/ssh_connection
fi

# alias ls="colorls --gs --group-directories-first"
# alias l="colorls -laA --sd --gs --group-directories-first"
# alias ll="colorls -l --sd --gs --group-directories-first"

# FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git
# sudo pacman -S fd the_silver_searcher(ag)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"
