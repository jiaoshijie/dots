# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# bear alias
alias mybear='bear -c ~/local/etc/bear.conf -l ~/local/lib/x86_64-linux-gnu/libear.so'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# for ipython
alias ipy='ipython qtconsole --pylab=inline --colors=Linux'
#for z3 clone, with newest git, if using z3 unstable branch, then the z3 is installed in /usr/bin/
#export PATH=/home/chyyuu/tools/git/bin:$PATH:/home/chyyuu/tools/z3/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/chyyuu/tools/z3/lib
#export PYTHONPATH=/home/chyyuu/tools/z3/lib/python2.7/dist-packages:$PYTHONPATH
# for pycharm
export PATH=$PATH:/home/chyyuu/tools/pycharm-3.0.1/bin
# for alarm clock: cuckoo
#export PATH=$PATH:/opt/extras.ubuntu.com/cuckoo/bin/
#for pomodoro
#export PATH=$PATH:/home/chyyuu/tools/TeamViz
#for mxcl-homebrew
#export PATH=$PATH:/home/chyyuu/tools/mxcl-homebrew-7db9ef9/bin
#for understand
export PATH=$PATH:/home/chyyuu/tools/scitools/bin/linux64
#for mendeley
export PATH=$PATH:/home/chyyuu/tools/mendeleydesktop-1.11-linux-x86_64/bin
#for python tomate :: pomodoro
#export PATH=$PATH:/home/chyyuu/tools/tomate/bin
#for android src download & development
#export PATH=$PATH:/home/chyyuu/tools/android-related/bin
#for ucore4arm dde4arm development
#export PATH=$PATH:/home/chyyuu/tools/arm-eabi-4.6/bin
#for android tools
#export PATH=$PATH:/home/chyyuu/tools/android-sdk-linux/tools
#for bionic libc 4 arm
#export PATH=$PATH:/home/chyyuu/tools/arm-linux-androideabi-4.6/bin
#for my useful scripts
#export PATH=$PATH:/home/chyyuu/researchmit/usefulscripts
#for linux checker: sparse
#export PATH=$PATH:/home/chyyuu/tools/sparse/bin
#for buglady
#export PATH=$PATH:/home/chyyuu/tools/buglady/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/chyyuu/tools/buglady/lib
#export PYTHONPATH=$PYTHONPATH:/home/chyyuu/tools/buglady/share/coccinelle/python
#for acrobat reader
export PATH=$PATH:/home/chyyuu/tools/Adobe/Reader9/bin
#for ldv tools, such as blast, etc.
#export PATH=$PATH:/home/chyyuu/tools/ldv-run/bin:/home/chyyuu/tools/ldv-run/dscv/rcv/backends/blast/bin
#for sudo ldv-manager can find res-manager
#alias sudo='sudo env PATH=$PATH'
#for ldv mysql
#export LDVDB=ldv
#export LDVUSER=root
#export LDVDBPASSWD=root
#export LDVDBHOST=localhost
#for doxygen
#export PATH=$PATH:/home/chyyuu/tools/doxygen/install-dir/bin
#for common cd path
export CDPATH=.:~/:~/develop:~/works/life-related:~/works/researchmit
#for verifast
#export PATH=$PATH:/home/chyyuu/develop/verifast-13.11.14/bin
#for todo.txt
#export PATH=$PATH:/home/chyyuu/tools/todo.txt-cli
. ~/.todo/todo_completion
#for z: a easy CD navigator
source ~/tools/z/z.sh
#for kvm spice
#export VIRSH_DEFAULT_CONNECT_URI="qemu:///session"
#dor XMind
#export PATH=$PATH:/home/chyyuu/tools/

# for ~/local/bin
export PATH=$PATH:/home/chyyuu/local/bin

#for fcitx
export  GTK_IM_MODULE=fcitx
export  QT_IM_MODULE=fcitx
export  XMODIFIERS=@im=fcitx

#for alias of git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gl='git log '
alias gh='git hist --all'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '

#set bash vi mode
set -o vi
#set bash prompt
PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"

#setup llvm-clang 3.4.2 path
#export PATH=/home/chyyuu/tools/clang+llvm-3.4.2-x86_64-linux-gnu-ubuntu-14.04/bin:$PATH
#setup llvm devel path
#export PATH=/ubuntu/chyyuu/develop/llvm-git/install/bin:$PATH

#for colorful less
PAGER='less -X -M' export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh  %s"
export LESS=' -R -N '
#echo    include \"sh.lang\"  >>/usr/share/source-highlight/default.lang

#add WPS path
#export PATH=/opt/kingsoft/wps-office:$PATH

#change ctrl caps key
setxkbmap -option ctrl:swapcaps
