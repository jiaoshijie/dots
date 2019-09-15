export ZSH=/usr/share/oh-my-zsh
export EDITOR='nvim'

# ZSH_THEME="agnoster"
ZSH_THEME="ys"
# ZSH_THEME="candy"
# ZSH_THEME="rkj-repos"

DISABLE_AUTO_UPDATE="true"

HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

########################
#自己定义的设置
alias SetProxy="export http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118"
alias UnSetProxy="unset http_proxy https_proxy"
alias lsnvidia="lspci | egrep 'VGA|3D'"
alias nvidiainfo="nvidia-smi"
alias nvidiaup="sudo tee /proc/acpi/bbswitch <<< 'ON'"
alias s=neofetch
alias p="ping www.baidu.com"
alias c=clear
alias x="xmodmap ~/.Xmodmap"
alias tbvimrc="cp ~/.vimrc ~/'Nutstore Files'/Nutstore/picture/bukeshiyong/vimrc"
# alias wgu="sudo wg-quick up wg0"
# alias wgd="sudo wg-quick down wg0"
alias hexedit="hexedit --color"
alias ntmux="tmux new -s"
alias atmux="tmux a -t"
alias tj="tmux new -s jie || tmux a -t jie"
alias fm=ranger
########################

# 以终端的形式运行emacs
alias EMACS="emacs -nw"

# git alias
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gd="git diff"
alias go="git checkout"
alias gl="git log --graph"
