#!/bin/sh

#cd `echo $1 | cut -d'/' -f1`
A=$1
for folder in "$@"
do
	cd "$folder"
	for file in *
	do
		name=`basename "$file" .mp3`
		new=`echo $name | sed 's/ - /+/g'`
		album=`echo $folder | cut -d'/' -f2`
		year=`echo $folder | cut -d',' -f2 | cut -d' ' -f2`
		title=`echo $new | cut -d'+' -f2`
		artist=`echo $new | cut -d'+' -f3`
		track=`echo $new | cut -d'+' -f1`
		id3 -A "$album" "$file" > /dev/null
		id3 -t "$title" "$file" > /dev/null
		id3 -a "$artist" "$file" > /dev/null
		id3 -y "$year" "$file" > /dev/null
		id3 -T "$track" "$file" > /dev/null
	done
	cd ../
	cd ../
done
