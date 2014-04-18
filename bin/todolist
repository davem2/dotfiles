#!/bin/sh
for item in `todo.sh lsc|sed 's/@//g'`
do
        echo `echo $item|tr a-z A-Z`
        todo.sh -p ls `echo @"$item"` |sed 's/@[^ ]*//g' |sed 's/^/  /'
done
