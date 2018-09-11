#!/usr/bin/perl -w

$total = 0;
@lines = <STDIN>;
chomp @lines;
foreach $word (@lines){
	$word =~ s/[^a-zA-Z ]/ /g;
	$word =~ s/ +/ /g;
	$word =~ s/^ //g;
	$word =~ s/ $//g;
	@string = split(/ /, $word);
	$total += ($#string+1);}

print "$total words\n";
