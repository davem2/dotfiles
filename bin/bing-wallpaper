#!/usr/bin/env bash

# adapted from https://github.com/thejandroman/bing-wallpaper/blob/master/bing-wallpaper.sh

BING_WALLPAPER_DIRECTORY="$HOME/wallpapers/bing-wallpapers/"
mkdir -p $BING_WALLPAPER_DIRECTORY

DownloadBingWallpaper() {

# Download bing wallpaper	
urls=( $(curl -s http://www.bing.com | \
    grep -Eo "url:'.*?'" | \
    sed -e "s/url:'\([^']*\)'.*/http:\/\/bing.com\1/" | \
    sed -e "s/\\\//g") )

# Save wallpaper if it's new
for p in ${urls[@]}; do
    filename=$(echo $p|sed -e "s/.*\/\(.*\)/\1/")
    todayWallpaper="$BING_WALLPAPER_DIRECTORY/$filename"
    if [ ! -f $todayWallpaper ]; then
        logger "Downloading: $filename ..."
        curl -Lo "$todayWallpaper" $p
    else
        logger "Skipping: $filename ..."
    fi
done

# Grab a random previously downloaded bing wallpaper to use for secondary display
randomWallpaper=$(find $BING_WALLPAPER_DIRECTORY ! -type d -print0 | shuf -z -n 1)

#feh --bg-fill "$todayWallpaper" "$randomWallpaper"
#alternate: pushes colors towards #777 to allow conky overlay (white) to be readable
convert "$randomWallpaper" -size 1x1 xc:\#777 -fx 'u*v.p{0,0}' jpg:- | feh --bg-fill - "$todayWallpaper"

logger "Wallpaper changed: $randomWallpaper, $todayWallpaper"

}

while true; do
    DownloadBingWallpaper
    sleep 12h
done
