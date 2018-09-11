#!/bin/sh

name=$1
time="text 0,10  '`ls -l $name | cut -d' ' -f6-8`'"
convert -gravity south -pointsize 36 -draw "$time" $name $name
display $name

