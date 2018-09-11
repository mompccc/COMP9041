#!/bin/sh

temp1=`env|sed 's/&/\&amp;/;s/</\&lt;/g;s/>/\&gt;/g'|egrep REMOTE_ADDR|cut -d'=' -f2`
temp3=`env|sed 's/&/\&amp;/;s/</\&lt;/g;s/>/\&gt;/g'|egrep HTTP_USER_AGENT|cut -d'=' -f2`
host=`host $temp1|cut -d' ' -f5|sed 's/.$//'`
# print HTTP header
# its best to print the header ASAP because 
# debugging is hard if an error stops a valid header being printed

echo Content-type: text/html
echo

# print page content

cat <<eof
<!DOCTYPE html>
<html lang="en">
<head>
<title>Browser IP, Host and User Agent</title>
</head>
<body>
eof

# print all environment variables
# This is interpreted as HTML so we replace some chars by the equivalent HTML entity.
# Note this will not guarantee security in all contexts.
echo "Your browser is running at IP address: <b>$temp1</b>"
echo "<p>"
echo "Your browser is running on hostname: <b>$host</b>"
echo "</p><p>"
echo "Your browser identifies as: <b>$temp3</b>"



cat <<eof
</body>
</html>
eof
