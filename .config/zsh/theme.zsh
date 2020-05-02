# 样式设置
autoload -U colors && colors

setopt prompt_subst

ZSH_THEME_GIT_PROMPT_PREFIX="(:"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

local git_info='$(git_prompt_info)'

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}:%~%{$fg[red]%}]%{$fg_bold[blue]%}${git_info}%{$reset_color%}$%b "
