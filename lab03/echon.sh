#!/bin/sh
num=1

if [ $3 ]
then
	echo 'Usage: ./echon.sh <number of lines> <string>'
	exit 
fi

if [ ! $2 ]
then
	echo 'Usage: ./echon.sh <number of lines> <string>'
	exit 
fi

if [ $1 -gt -1 ] 2>/dev/null
then
	a=1
else
	echo './echon.sh: argument 1 must be a non-negative integer'
	exit
fi

if [ $1 -lt 0 ]
then
	echo './echon.sh: argument 1 must be a non-negative integer'
	exit 
fi

while [ $num -le $1 ]
do
	echo $2
	let "num++"
done
