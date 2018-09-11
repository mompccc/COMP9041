#!/bin/sh
small=
medium=
large=
for file in *
do
	num=`cat "$file" | wc -l`
	if [ "$num" -lt 10 ]
	then
		small="$small"" $file"
	elif [ "$num" -lt 100 ]
	then
		medium="$medium"" $file"
	else
		large="$large"" $file"
	fi
done
echo "Small files:$small"
echo "Medium-sized files:$medium"
echo "Large files:$large"
