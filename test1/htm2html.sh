#!/bin/sh

for file in *.htm
do
	temp="${file%.htm}.html"
	if [ -f "$temp" ]; then
		echo "${file%.htm}.html exists"
		exit 1
	fi
	rename 's/\.htm/.html/' "$file" 2>/dev/null
done
