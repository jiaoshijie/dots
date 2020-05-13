export ZSH=$HOME/.config/zsh

# basic config
setopt autocd # Automatically cd into typed directory.
stty stop undef # Disable ctrl-s to freeze terminal.
# Emacs-mode
bindkey -e
export KEYTIMEOUT=1
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# Edit the current command line in $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

#路径别名 进入相应的路径时只要 cd ~xxx
hash -d NUT="$HOME/Nutstore Files/Nutstore/MARKDOWN_NOTE"
hash -d PKG="/var/cache/pacman/pkg"

# git
[ -f $ZSH/git.zsh ] && source $ZSH/git.zsh

# theme
[ -f $ZSH/theme.zsh ] && source $ZSH/theme.zsh

# History:
[ -f $ZSH/history.zsh ] && source $ZSH/history.zsh

# COM-alias
[ -f $ZSH/aliasrc ] && source $ZSH/aliasrc

# SSH-alias
[ -f $HOME/.ssh/ssh_connection ] && source $HOME/.ssh/ssh_connection

# zsh-complete
[ -f $ZSH/complete.zsh ] && source $ZSH/complete.zsh

# FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git
# sudo pacman -S the_silver_searcher
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

# Plugins
[ -f $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
