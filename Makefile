PACKAGE_NAMES=bash bin cheat conky mpv obmenu-generator openbox slim teamocil tint2 tmux volumeicon X11 xfce-terminal vim zsh

DOTFILES=$(shell pwd)

.PHONY: all install $(PACKAGE_NAMES)
all: $(PACKAGE_NAMES)
install: all

# Metapackages
openbox-desktop: openbox obmenu-generator conky tint2 volumeicon X11
base: zsh bin cheat tmux teamocil xfce-terminal


awesome:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/awesome/rc.lua ${HOME}/.config/awesome/rc.lua

bash:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/bash/bashrc ${HOME}/.bashrc
	@$(DOTFILES)/deploy $@ $(DOTFILES)/bash/dircolors ${HOME}/.dircolors

bin:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/bin ${HOME}/bin

cheat:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/cheat ${HOME}/.cheat

conky:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/conky/conkyrc1 ${HOME}/.conkyrc

obmenu-generator:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/obmenu-generator/schema.pl ${HOME}/.config/obmenu-generator/schema.pl

mpv:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/mpv/config ${HOME}/.mpv/config

openbox:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/openbox/environment ${HOME}/.config/openbox/environment
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/openbox/autostart ${HOME}/.config/openbox/autostart
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/openbox/menu.xml ${HOME}/.config/openbox/menu.xml
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/openbox/rc_base.xml ${HOME}/.config/openbox/rc.xml

slim:
	@printf "%s\n    %s -> %s\n" "$@" "$(DOTFILES)/desktop/slim/slim.conf" "/etc/slim.conf"
	@mkdir -p $(DOTFILES)/backup/$@ && cp -n /etc/slim.conf $(DOTFILES)/backup/$@/
	sudo ln -fs $(DOTFILES)/desktop/slim/slim.conf /etc/slim.conf

teamocil:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/teamocil ${HOME}/.teamocil

tint2:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/tint2/icon_only_4.tint2rc ${HOME}/.config/tint2/icon_only_4.tint2rc
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/tint2/tint2confrc ${HOME}/.config/tint2/tint2confrc
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/tint2/tint2rc ${HOME}/.config/tint2/tint2rc

tmux:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/tmux/tmux.conf ${HOME}/.tmux.conf

volumeicon:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/volumeicon/volumeicon ${HOME}/.config/volumeicon/volumeicon

vim:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/vim/vimrc ${HOME}/.vimrc

X11:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/xinitrc ${HOME}/.xinitrc

xfce-terminal:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/xfce/terminal/terminalrc ${HOME}/.config/xfce4/terminal/terminalrc
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/xfce/terminal/accels.scm ${HOME}/.config/xfce4/terminal/accels.scm
	@$(DOTFILES)/deploy $@ $(DOTFILES)/desktop/xfce/terminal/background1.jpg ${HOME}/.config/xfce4/terminal/background.jpg

zsh:
	@$(DOTFILES)/deploy $@ $(DOTFILES)/zsh/zshrc ${HOME}/.zshrc
	@$(DOTFILES)/deploy $@ $(DOTFILES)/zsh/zshenv ${HOME}/.zshenv

