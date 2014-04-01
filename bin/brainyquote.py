#!/bin/python
#
# Extracts Quotes from brainyquote.com
#

#DATA=$(curl "http://www.brainyquote.com/quotes_of_the_day.html" | sed '{:q;N;s/\n//g;t q}')
#QUOTE=$(echo $DATA | grep -o '<div class="boxyPaddingBig"><h2>Quote of the Day</h2><span class="bqQuoteLink"><a [^>]*[^<]*' | grep -o '[^>]*$' | sed -n '1p')
#AUTHOR=$(echo $DATA | grep -o '<a title="view author" [^>]*[^<]*' | grep -o '[^>]*$' | sed -n '1p')

#printf "$QUOTE\n$AUTHOR\n"


# curl "http://www.brainyquote.com/quotes_of_the_day.html" | sed '{:q;N;s/\n//g;t q}' | grep -o '<div class="boxyPaddingBig"><h2>Quote of the Day</h2><span class="bqQuoteLink"><a [^>]*[^<]*' | grep -o '[^>]*$'


from bs4 import BeautifulSoup
import requests
import random

htmldata = requests.get('http://www.brainyquote.com/quotes_of_the_day.html')
soup = BeautifulSoup(htmldata.text)

quote = soup.find_all("a", title="view quote")
author = soup.find_all("a", title="view author")

QUOTES_PER_DAY = 5
v = random.randint(0,QUOTES_PER_DAY-1)
print(quote[v].string + "\n-- " + author[v].string)
