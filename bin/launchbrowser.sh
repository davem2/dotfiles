#!/bin/sh
# Browser wrapper with popup feedback
# License: CC0 (Public Domain)
#

#export MOZ_GLX_IGNORE_BLACKLIST=1
export MOZ_DISABLE_PANGO=1

icon=firefox
firefox=/usr/bin/firefox

## fix empty urls
URL="$*"; [ -z "$URL" ] && URL=about:home
printf "** $URL"

## I like to know when URL was sent to a browser (notify-osd)
notify-send -t 2000 -i $icon -h string:x-canonical-append:browser "Opening URL" "$URL" &

# try xremote first
$firefox -new-tab "$URL" && exit 0
# if xremote failed, then launch the browser
$firefox "$URL"
