#!/usr/bin/perl -w

@input = <STDIN>;
chomp @input;
foreach $line (@input){
	$line =~ s/\d+//g;
	print "$line\n";}
