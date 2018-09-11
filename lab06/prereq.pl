#!/usr/bin/perl -w

$course = $ARGV[0];

$url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2017/$course.html";
open F, "wget -q -O- $url|" or die;
while ($line = <F>) {
	if ($line =~ /Prerequisite/){
		@array = split(/ /, $line);
		foreach $A (@array){
			if ($A =~ /[A-Z]{4}\d{4}/){
				$A =~ s/[<.,].*//;
    			push @B, $A;}}}
}


$url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2017/$course.html";
open F, "wget -q -O- $url|" or die;
while ($line = <F>) {
	if ($line =~ /Prerequisite/){
		@array = split(/ /, $line);
		foreach $A (@array){
			if ($A =~ /[A-Z]{4}\d{4}/){
				$A =~ s/[<.,].*//;
    			push @B, $A;}}}
}
foreach $Q (@B){
	print "$Q\n";}
