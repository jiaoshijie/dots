V := @

help:
	$(V)vim ~/dotfiles/Makefile

my-script:
	$(V)ln -sf $(HOME)/dotfiles/my_script/maimpick ~/.local/bin/maimpick
	$(V)ln -sf $(HOME)/dotfiles/my_script/ext ~/.local/bin/ext
	$(V)ln -sf $(HOME)/dotfiles/my_script/texclear ~/.local/bin/texclear
	$(V)ln -sf $(HOME)/dotfiles/my_script/ifinstalled ~/.local/bin/ifinstalled
	$(V)ln -sf $(HOME)/dotfiles/my_script/lmc ~/.local/bin/lmc
	$(V)ln -sf $(HOME)/dotfiles/my_script/lf-select ~/.local/bin/lf-select
	$(V)ln -sf $(HOME)/dotfiles/my_script/rotdir ~/.local/bin/rotdir
	$(V)ln -sf $(HOME)/dotfiles/my_script/set-bg ~/.local/bin/set-bg
	$(V)ln -sf $(HOME)/dotfiles/my_script/setctags_c ~/.local/bin/setctags_c
	$(V)ln -sf $(HOME)/dotfiles/my_script/remaps ~/.local/bin/remaps
	$(V)ln -sf $(HOME)/dotfiles/my_script/copyq_clear_history ~/.local/bin/cch
	$(V)ln -sf $(HOME)/dotfiles/my_script/rmnvidiamod ~/.local/bin/rmnvidiamod
	$(V)ln -sf $(HOME)/dotfiles/my_script/pickfull ~/.local/bin/pickfull
	$(V)ln -sf $(HOME)/dotfiles/clash/.config/clash/updateSub_setUi ~/.local/bin/updateclash
	$(V)echo "执行成功"

zsh:
	$(V)echo "source $(HOME)/dotfiles/shell/.config/shell/profile" > ~/.zprofile

bash:
	$(V)echo "source $(HOME)/dotfiles/shell/.config/shell/profile" > ~/.bash_profile

programs:
	$(V)pacman -Qqem > ./programs/aur.list
	$(V)pipx list | grep --extended-regexp '^\W+package' | awk -F ' ' '{print $$2}' > ./programs/python.list
