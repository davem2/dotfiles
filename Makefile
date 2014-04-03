PACKAGE_NAMES=bash bin conky tmux X11

DOTFILES=$(shell pwd)

.PHONY: all install $(PACKAGE_NAMES)

all: $(PACKAGE_NAMES)
install: all

bash:
	ln -fsb $(DOTFILES)/bash/bashrc ${HOME}/.bashrc

bin:
	if [ -d ${HOME}/bin ] && [ ! -h ${HOME}/bin ]; then mv ${HOME}/bin ${HOME}/bin~; fi;
	ln -fsbn $(DOTFILES)/bin/ ${HOME}/bin

cheat:
	if [ -d ${HOME}/cheat ] && [ ! -h ${HOME}/cheat ]; then mv ${HOME}/cheat ${HOME}/cheat~; fi;
	ln -fsbn $(DOTFILES)/cheat/ ${HOME}/.cheat

conky:
	ln -fsb $(DOTFILES)/conky/conkyrc1 ${HOME}/.conkyrc

tmux:
	ln -fsb $(DOTFILES)/tmux/tmux.conf ${HOME}/.tmux.conf

X11:
	ln -fsb $(DOTFILES)/xinitrc ${HOME}/.xinitrc


