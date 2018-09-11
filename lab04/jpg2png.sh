#!/bin/sh
#convert

for image in *.jpg
do
	if [ -f "${image%.jpg}.png" ]
	then
		echo "${image%.jpg}.png already exists" 
	else
		convert "$image" "${image%.jpg}.png"
	fi
done

for file in "*.jpg"
do
	rm $file
done
