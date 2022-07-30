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
# export MANPAGER="sh -c 'col -bx | nvim -R -c \"set ft=man\" -'"

# git
[ -f ~/.config/shell/git.zsh ] && source ~/.config/shell/git.zsh

# theme
[ -f ~/.config/shell/theme.zsh ] && source ~/.config/shell/theme.zsh

# History:
[ -f ~/.config/shell/history.zsh ] && source ~/.config/shell/history.zsh

# COM-alias
[ -f ~/.config/shell/aliasrc ] && source ~/.config/shell/aliasrc

# zsh-complete
[ -f ~/.config/shell/complete.zsh ] && source ~/.config/shell/complete.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% --reverse --multi --info=inline --preview-window='right:hidden' --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || bat --style=numbers --color=always --line-range :500 {} 2> /dev/null' --bind='F2:toggle-preview'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# Plugins
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh --cmd j)"
eval "~/dotfiles/my_script/fcl"
