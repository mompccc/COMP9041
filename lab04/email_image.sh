#!/bin/sh

for picture in $@
do
	echo "Address to e-mail this image to?"
	read addr
	echo "Message to accompany image?"
	read msg
	echo $msg|mutt -s 'penguins!' -e 'set copy=no' -a $picture -- $addr
	echo "$picture sent to $addr"
done
TAGmail_image.sh                 mail_image.sh                 Album1, 2015                  2015                              �