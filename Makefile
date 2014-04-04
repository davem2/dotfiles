PACKAGE_NAMES=bash bin cheat conky obmenu-generator openbox slim tint2 tmux volumeicon X11

DOTFILES=$(shell pwd)

.PHONY: all install $(PACKAGE_NAMES)
all: $(PACKAGE_NAMES)
install: all

# Metapackages
openbox-desktop: openbox-base obmenu-generator conky tint2 volumeicon X11
base: bash bin cheat tmux 


bash:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/bash/bashrc ${HOME}/.bashrc

bin:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/bin/ ${HOME}/bin

cheat:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/cheat/ ${HOME}/.cheat

conky:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/conky/conkyrc1 ${HOME}/.conkyrc

obmenu-generator:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/obmenu-generator/schema.pl ${HOME}/.config/obmenu-generator/schema.pl
	
openbox:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/openbox/autostart ${HOME}/.config/openbox/autostart
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/openbox/menu.xml ${HOME}/.config/openbox/menu.xml
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/openbox/rc.xml ${HOME}/.config/openbox/rc.xml
	
slim:
	@printf "%s\n    %s -> %s\n" "$@" "$(DOTFILES)/desktop/slim/slim.conf" "/etc/slim.conf" 
	@mkdir -p $(DOTFILES)/backup/$@ && cp -n /etc/slim.conf $(DOTFILES)/backup/$@/
	sudo ln -fs $(DOTFILES)/desktop/slim/slim.conf /etc/slim.conf

tint2:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/tint2/icon_only_4.tint2rc ${HOME}/.config/tint2/icon_only_4.tint2rc
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/tint2/tint2confrc ${HOME}/.config/tint2/tint2confrc
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/tint2/tint2rc ${HOME}/.config/tint2/tint2rc
		
tmux:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/tmux/tmux.conf ${HOME}/.tmux.conf

volumeicon:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/volumeicon/volumeicon ${HOME}/.config/volumeicon/volumeicon
		
X11:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/xinitrc ${HOME}/.xinitrc
