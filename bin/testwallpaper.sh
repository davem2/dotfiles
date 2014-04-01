#!/bin/bash

Dir="/home/david/wallpapers/"
#Dir=$1

if [ ! -d "$Dir" ]; then 
    echo "Not Exist $Dir"
    exit 1
fi

SetBG () {
while IFS= read -rd '' file; do list+=("$file"); done < <(find "$Dir" ! -type d -print0)
TotalFiles=${#list[@]}

RandomNumber=$(( $RANDOM % $TotalFiles ))
test ! $RandomNumber = 0 || RandomNumber=1
RandomFile1="${list[RandomNumber]}"
#RandomFile1="/home/david/wallpapers/sfbg.jpg"

RandomNumber=$(( $RANDOM % $TotalFiles ))
test ! $RandomNumber = 0 || RandomNumber=1
RandomFile2="${list[RandomNumber]}"

#echo "Selected File: $RandomFile1"
feh --bg-fill "${RandomFile1}" "${RandomFile2}"

logger "Wallpaper changed: $RandomFile1, $RandomFile2"

}

while true; do
    SetBG
    read -n 1 -s 
done
