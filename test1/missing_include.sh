#!/bin/sh
input=$@
for name in $input
do
	lines=`cat $name | egrep "#include \".*\"" | cut -d'"' -f2`
	for file in $lines
	do
		if [ ! -f "$file" ]; then
			echo "$file included into $name does not exist"
		fi
	done
done
