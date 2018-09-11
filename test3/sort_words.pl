#!/usr/bin/perl -w

@string = <STDIN>;
chomp @string;
foreach $lines (@string){
	@line = split(/ +/, $lines);
	print join(' ', sort @line),"\n";
}
