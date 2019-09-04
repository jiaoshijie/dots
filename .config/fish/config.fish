export EDITOR=/usr/bin/nvim
########################
#自己定义的设置
alias SetProxy="export http_proxy=http://127.0.0.1:8118 export https_proxy=http://127.0.0.1:8118"
alias UnSetProxy="unset http_proxy https_proxy"
alias lsnvidia="lspci | egrep 'VGA|3D'"
alias nvidiainfo="nvidia-smi"
# alias nvidiaup="sudo tee /proc/acpi/bbswitch <<< 'ON'"
alias s=neofetch
alias p="ping www.baidu.com"
alias c=clear
alias x="xmodmap ~/.Xmodmap"
alias tbvimrc="cp ~/.vimrc ~/'Nutstore Files'/Nutstore/picture/bukeshiyong/vimrc"
alias wgu="sudo wg-quick up wg0"
alias wgd="sudo wg-quick down wg0"
alias hexedit="hexedit --color"
alias ntmux="tmux new -s"
alias atmux="tmux a -t"
alias ntj="tmux new -s jie"
alias atj="tmux a -t jie"
alias fm=ranger
########################

# 以终端的形式运行emacs
alias EMACS="emacs -nw"

# git alias
alias gs="git status"
