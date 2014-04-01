#!/bin/bash

Dir1="/home/david/wallpapers/main"
Dir2="/home/david/wallpapers/"
#Dir=$1

if [ ! -d "$Dir1" ]; then 
    echo "Not Exist $Dir1"
    exit 1
fi

if [ ! -d "$Dir2" ]; then 
    echo "Not Exist $Dir2"
    exit 1
fi

SetBG () {

unset list1	
while IFS= read -rd '' file; do list1+=("$file"); done < <(find "$Dir1" ! -type d -print0)
TotalFiles1=${#list1[@]}

unset list2
while IFS= read -rd '' file; do list2+=("$file"); done < <(find "$Dir2" ! -type d -print0)
TotalFiles2=${#list2[@]}

RandomNumber=$(( $RANDOM % $TotalFiles1 ))
test ! $RandomNumber = 0 || RandomNumber=1
RandomFile1="${list1[RandomNumber]}"
#RandomFile1="/home/david/wallpapers/sfbg.jpg"

RandomNumber=$(( $RANDOM % $TotalFiles2 ))
test ! $RandomNumber = 0 || RandomNumber=1
RandomFile2="${list2[RandomNumber]}"

# Set background(s) with feh
#feh --bg-fill "${RandomFile1}" "${RandomFile2}"
#alternate: pushes colors towards #aaa
convert "${RandomFile1}" -size 1x1 xc:\#aaa -fx 'u*v.p{0,0}' jpg:- | feh --bg-fill - "${RandomFile2}"

logger "Wallpaper changed: $RandomFile1, $RandomFile2"
logger "$TotalFiles1, $TotalFiles2"

}

while true; do
    SetBG
    sleep 33m
done
