V := @

help:
	$(V)vim ~/dotfiles/Makefile

programs:
	$(V)pacman -Qqem > ./programs/aur.list
	$(V)pipx list | grep --extended-regexp '^\W+package' | awk -F ' ' '{print $$2}' > ./programs/python.list
