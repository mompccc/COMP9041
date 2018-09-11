#!/usr/bin/perl -w

@string = <STDIN>;
chomp @string;
foreach $line (@string){
	$line =~ tr/[0-4]/</;
	$line =~ tr/[6-9]/>/;
	print "$line\n";
}
