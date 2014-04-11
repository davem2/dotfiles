#!/bin/bash

DIR1="${HOME}/wallpapers/main"	# Wallpapers specific for main monitor containing conky overlay
DIR2="${HOME}/wallpapers/"		# Wallpapers for secondary monitor(s)
#DIR1=$1						# TODO: Allow wallpaper directories to be passed as command line args?

if [ ! -d "$DIR1" ]; then 
    echo "No such directory: $DIR1"
    exit 1
elif [ ! -d "$DIR2" ]; then 
    echo "No such directory: $DIR2"
    exit 1
fi

SetBG () {

#bg1="${HOME}/wallpapers/sfbg.jpg"
bg1=$(find "$DIR1" ! -type d -print0 | shuf -z -n 1)
bg2=$(find "$DIR2" ! -type d -print0 | shuf -z -n 1)

# Set background(s) with feh
#feh --bg-fill "${bg1}" "${bg2}"
#alternate: pushes colors towards #aaa
convert "${bg1}" -size 1x1 xc:\#aaa -fx 'u*v.p{0,0}' jpg:- | feh --bg-fill - "${bg2}"

logger "Wallpaper changed: $bg1, $bg2"

}

while true; do
    SetBG
    sleep 33m
done
