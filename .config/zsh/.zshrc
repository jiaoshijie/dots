export ZSH_CUSTOM=$HOME/.my-zsh
# autoload -U promptinit
# promptinit
# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# setopt autocd # Automatically cd into typed directory.
stty stop undef # Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history

[ -f ~/.aliasrc ] && source ~/.aliasrc

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zmodload zsh/complist
setopt completealiases
compinit
_comp_options+=(globdots) # Include hidden files

bindkey -e
export KEYTIMEOUT=1

# Edit line in vim with ctrl-i:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^i' edit-command-line

if [ -f ~/.ssh/ssh_connection ]; then
  source ~/.ssh/ssh_connection
fi

# FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git
# sudo pacman -S fd the_silver_searcher(ag)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"

source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
