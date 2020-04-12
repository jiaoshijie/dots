export ZSH=/usr/share/oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh
# ZSH_THEME="robbyrussell"
ZSH_THEME="ys"
# ZSH_THEME="simple"
DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="mm/dd/yyyy"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
# zsh-completions
# autoload -U compinit && compinit
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh

########################
#自己定义的设置
# alias-keys
# git clone https://github.com/kaelzhang/shell-safe-rm.git
alias rm="~/.local/bin/shell-safe-rm/bin/rm.sh"

alias SetProxy="export http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118"
alias UnSetProxy="unset http_proxy https_proxy"
# alias wgu="sudo wg-quick up wg0"
# alias wgd="sudo wg-quick down wg0"

alias lsvideo="lspci | egrep 'VGA|3D'"
alias catvideo='glxinfo | grep "OpenGL renderer"'
alias infonvidia="nvidia-smi"
alias nvidiaup="sudo tee /proc/acpi/bbswitch <<< 'ON'"
alias nvidiadown="sudo rmmod nvidia && sudo tee /proc/acpi/bbswitch <<< OFF"

alias s=neofetch
alias Semojis="cat Nutstore\ Files/Nutstore/MARKDOWN_NOTE/.usefulfile/emoji | dmenu -i -l 20"
alias p="ping www.baidu.com"
alias c=clear
alias x="xmodmap ~/.Xmodmap"
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

# FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git
# sudo pacman -S fd the_silver_searcher(ag)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
