#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# TODO: Best place for this?
setxkbmap -option 'caps:ctrl_modifier'
setxkbmap -option 'caps:escape'
xcape -e 'Caps_Lock=Escape'

#tint2 &
# Set random wallpaper
#nohup sleep 15 && /home/david/bin/randomwallpaper.sh &
# Start conky
#nohup sleep 20 && conky &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec razor-session

# exec WM chosen from SLiM
exec openbox-session

# xscreensaver
/usr/bin/xscreensaver -no-splash &

