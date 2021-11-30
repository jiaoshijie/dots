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

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANPAGER="nvim -c 'set ft=man' -"

#路径别名 进入相应的路径时只要 cd ~xxx
hash -d NUT="$HOME/Nutstore Files/Nutstore/MARKDOWN_NOTE"
hash -d PKG="/var/cache/pacman/pkg"

# git
[ -f ~/.config/shell/git.zsh ] && source ~/.config/shell/git.zsh

# theme
[ -f ~/.config/shell/theme.zsh ] && source ~/.config/shell/theme.zsh

# History:
[ -f ~/.config/shell/history.zsh ] && source ~/.config/shell/history.zsh

# COM-alias
[ -f ~/.config/shell/aliasrc ] && source ~/.config/shell/aliasrc

# SSH-alias
[ -f $HOME/.ssh/ssh_connection ] && source $HOME/.ssh/ssh_connection

# zsh-complete
[ -f ~/.config/shell/complete.zsh ] && source ~/.config/shell/complete.zsh

[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git
# sudo pacman -S (the_silver_searcher)fd
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS="--height 60% --border --preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window up"
export FZF_DEFAULT_OPTS="--height 60% --border"
# export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"

# Plugins
[ -f ~/.config/shell/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.config/shell/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.config/shell/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/.config/shell/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh --cmd j)"
eval "fortune | cowsay | lolcat -t"
