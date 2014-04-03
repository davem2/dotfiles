PACKAGE_NAMES=bash bin cheat conky obmenu-generator openbox slim tint2 tmux volumeicon X11

DOTFILES=$(shell pwd)

.PHONY: all install $(PACKAGE_NAMES)
all: $(PACKAGE_NAMES)
install: all

# Metapackages
openbox-desktop: openbox-base obmenu-generator conky tint2 volumeicon X11
base: bash bin cheat tmux 


bash:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.bashrc $(DOTFILES)/backup/$@/
	ln -fs $(DOTFILES)/bash/bashrc ${HOME}/.bashrc

bin:
	cp -nr ${HOME}/bin $(DOTFILES)/backup/
	ln -fsn $(DOTFILES)/bin/ ${HOME}/bin

cheat:
	cp -nr ${HOME}/.cheat $(DOTFILES)/backup/
	ln -fsn $(DOTFILES)/cheat/ ${HOME}/.cheat

conky:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.conkyrc $(DOTFILES)/backup/$@/
	ln -fs $(DOTFILES)/desktop/conky/conkyrc1 ${HOME}/.conkyrc

obmenu-generator:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.config/obmenu-generator/schema.pl $(DOTFILES)/backup/$@/
	ln -fs $(DOTFILES)/desktop/obmenu-generator/schema.pl ${HOME}/.config/obmenu-generator/schema.pl
	
openbox:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.config/openbox/autostart $(DOTFILES)/backup/$@/
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.config/openbox/menu.xml $(DOTFILES)/backup/$@/
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.config/openbox/rc.xml $(DOTFILES)/backup/$@/
	ln -fs $(DOTFILES)/desktop/openbox/autostart ${HOME}/.config/openbox/autostart
	ln -fs $(DOTFILES)/desktop/openbox/menu.xml ${HOME}/.config/openbox/menu.xml
	ln -fs $(DOTFILES)/desktop/openbox/rc.xml ${HOME}/.config/openbox/rc.xml
	
slim:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n /etc/slim.conf $(DOTFILES)/backup/$@/
	sudo ln -fs $(DOTFILES)/desktop/slim/slim.conf /etc/slim.conf

tint2:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.config/tint2/icon_only_4.tint2rc $(DOTFILES)/backup/$@/
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.config/tint2/tint2confrc $(DOTFILES)/backup/$@/
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.config/tint2/tint2rc $(DOTFILES)/backup/$@/
	ln -fs $(DOTFILES)/desktop/tint2/icon_only_4.tint2rc ${HOME}/.config/tint2/icon_only_4.tint2rc
	ln -fs $(DOTFILES)/desktop/tint2/tint2confrc ${HOME}/.config/tint2/tint2confrc
	ln -fs $(DOTFILES)/desktop/tint2/tint2rc ${HOME}/.config/tint2/tint2rc
		
tmux:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.tmux.conf $(DOTFILES)/backup/$@/
	ln -fs $(DOTFILES)/tmux/tmux.conf ${HOME}/.tmux.conf

volumeicon:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.config/volumeicon/volumeicon $(DOTFILES)/backup/$@/
	ln -fs $(DOTFILES)/desktop/volumeicon/volumeicon ${HOME}/.config/volumeicon/volumeicon
		
X11:
	mkdir -p $(DOTFILES)/backup/$@ && cp -n ${HOME}/.xinitrc $(DOTFILES)/backup/$@/
	ln -fs $(DOTFILES)/xinitrc ${HOME}/.xinitrc

