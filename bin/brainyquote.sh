#!/bin/bash
#
# Extracts Quote of the day from brainyquote.com
#

DATA=$(curl "http://www.brainyquote.com/quotes_of_the_day.html" | sed '{:q;N;s/\n//g;t q}')
QUOTE=$(echo $DATA | grep -o '<div class="boxyPaddingBig"><h2>Quote of the Day</h2><span class="bqQuoteLink"><a [^>]*[^<]*' | grep -o '[^>]*$' | sed -n '1p')
AUTHOR=$(echo $DATA | grep -o '<a title="view author" [^>]*[^<]*' | grep -o '[^>]*$' | sed -n '1p')

printf "$QUOTE\n$AUTHOR\n"


# curl "http://www.brainyquote.com/quotes_of_the_day.html" | sed '{:q;N;s/\n//g;t q}' | grep -o '<div class="boxyPaddingBig"><h2>Quote of the Day</h2><span class="bqQuoteLink"><a [^>]*[^<]*' | grep -o '[^>]*$'
