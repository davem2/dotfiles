PACKAGE_NAMES=bash bin conky tmux X11 openbox obmenu-generator tint2 volumeicon

DOTFILES=$(shell pwd)

.PHONY: all install $(PACKAGE_NAMES)
all: $(PACKAGE_NAMES)
install: all

# Metapackages
openbox-desktop: openbox-base obmenu-generator conky tint2 volumeicon X11
base: bash bin cheat tmux 


bash:
	ln -fsb $(DOTFILES)/bash/bashrc ${HOME}/.bashrc

bin:
	ln -fsn $(DOTFILES)/bin/ ${HOME}/bin

cheat:
	ln -fsn $(DOTFILES)/cheat/ ${HOME}/.cheat

conky:
	ln -fsb $(DOTFILES)/desktop/conky/conkyrc1 ${HOME}/.conkyrc

obmenu-generator:
	ln -fsb $(DOTFILES)/desktop/obmenu-generator/schema.pl ${HOME}/.config/obmenu-generator/schema.pl
	
openbox:
	ln -fsb $(DOTFILES)/desktop/openbox/autostart ${HOME}/.config/openbox/autostart
	ln -fsb $(DOTFILES)/desktop/openbox/menu.xml ${HOME}/.config/openbox/menu.xml
	ln -fsb $(DOTFILES)/desktop/openbox/rc.xml ${HOME}/.config/openbox/rc.xml
	
slim:
	sudo ln -fsb $(DOTFILES)/desktop/slim/slim.conf /etc/slim.conf

tint2:
	ln -fsb $(DOTFILES)/desktop/tint2/icon_only_4.tint2rc ${HOME}/.config/tint2/icon_only_4.tint2rc
	ln -fsb $(DOTFILES)/desktop/tint2/tint2confrc ${HOME}/.config/tint2/tint2confrc
	ln -fsb $(DOTFILES)/desktop/tint2/tint2rc ${HOME}/.config/tint2/tint2rc
		
tmux:
	ln -fsb $(DOTFILES)/tmux/tmux.conf ${HOME}/.tmux.conf

volumeicon:
	ln -fsb $(DOTFILES)/desktop/volumeicon/volumeicon ${HOME}/.config/volumeicon/volumeicon
		
X11:
	ln -fsb $(DOTFILES)/xinitrc ${HOME}/.xinitrc

