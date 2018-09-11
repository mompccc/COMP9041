#!/usr/bin/perl -w

$A = $ARGV[0];
$total = 0;
@lines = <STDIN>;
chomp @lines;
foreach $word (@lines){
	$word =~ s/[^a-zA-Z ]/ /g;
	$word =~ s/ +/ /g;
	$word =~ s/^ //g;
	$word =~ s/ $//g;
	@string = split(/ /, $word);
	foreach $B (@string){
		$B =~ s/ *//g;
		if (lc($A) eq lc($B)){
			$total += 1;}}}

print "$A occurred $total times\n";
