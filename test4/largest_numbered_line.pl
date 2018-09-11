#!/usr/bin/perl -w
use List::Util qw/max min/;

%data = ();
while (<STDIN>){
	$INPUT = $_;
	$IN = $INPUT;
	$IN =~ s/--/-/;
	$IN =~ s/--//;
	$IN =~ s/\.$//;
	$IN =~ s/[^-?\d*\.?\d*]/ /g;
	$IN =~ s/ +/ /g;
	$IN =~ s/^ //;
	$IN =~ s/ $//;
	@number = split(/ /, $IN);
	$MAX = -99999;
	foreach $i (@number){
		if (not $i eq "-"){
			if ($i > $MAX){
				$MAX = $i;}}}
	if (int($MAX) == $MAX){
		$MAX = int($MAX);}
	if (not $data{"$MAX"}){
		$data{"$MAX"} = "$INPUT";}
	else{
		$data{"$MAX"} = $data{"$MAX"}."$INPUT";}
}

@KEY = keys %data;

$big = max @KEY;
if ($big != -99999){
	print $data{"$big"}};
