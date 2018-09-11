#!/usr/bin/perl -w

$name = $ARGV[0];
$sum = 0;
$count = 0;
@string = <STDIN>;
chomp @string;
foreach $data (@string){
	$B = $data;
	@a= split(/ /, $data);
	$A=$a[0];
	$B =~ s/\d*//g;
	$B =~s/^ +//;
	if ($B eq $name){
		$count ++;
		$sum = $sum + $A;}
}

print "$name observations: $count pods, $sum individuals\n";
