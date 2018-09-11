#!/usr/bin/perl -w

$n = 0;
$size = @ARGV;

if ($size != 2){
	print "Usage: ./echon.pl <number of lines> <string>\n";
	exit 0;
}

if (not $ARGV[0] =~ m/^\d+$/){
	print "./echon.pl: argument 1 must be a non-negative integer\n";
	exit 0;
}

if ($ARGV[0] == 0){
	exit 0;
}

if ($ARGV[0] < 0){
	print "./echon.pl: argument 1 must be a non-negative integer\n";
	exit 0;
}

while ($n < $ARGV[0]){
	print "$ARGV[1]\n";
	$n += 1;
}
