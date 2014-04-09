#!/usr/bin/env bash

# adapted from https://github.com/thejandroman/bing-wallpaper/blob/master/bing-wallpaper.sh

PICTURE_DIR="$HOME/wallpapers/bing-wallpapers/"

mkdir -p $PICTURE_DIR

DownloadBingWallpaper() {

# Download bing wallpaper	
urls=( $(curl -s http://www.bing.com | \
    grep -Eo "url:'.*?'" | \
    sed -e "s/url:'\([^']*\)'.*/http:\/\/bing.com\1/" | \
    sed -e "s/\\\//g") )

# Save wallpaper if it's new
for p in ${urls[@]}; do
    filename=$(echo $p|sed -e "s/.*\/\(.*\)/\1/")
    if [ ! -f $PICTURE_DIR/$filename ]; then
        logger "Downloading: $filename ..."
        curl -Lo "$PICTURE_DIR/$filename" $p
    else
        logger "Skipping: $filename ..."
    fi
done

# Grab a random previously downloaded bing wallpaper to use for secondary display
RANDOM_WALLPAPER=$(ls $PICTURE_DIR | shuf -n 1)

#feh --bg-fill "$PICTURE_DIR/$filename" "$PICTURE_DIR/$RANDOM_WALLPAPER"
#alternate: pushes colors towards #aaa
convert "$PICTURE_DIR/$RANDOM_WALLPAPER" -size 1x1 xc:\#aaa -fx 'u*v.p{0,0}' jpg:- | feh --bg-fill - "$PICTURE_DIR/$filename"

}

while true; do
    DownloadBingWallpaper
    sleep 12h
done
