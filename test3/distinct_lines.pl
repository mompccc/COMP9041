#!/usr/bin/perl -w

$num = $ARGV[0];
$count = 0;
$sum = 0;
while (<STDIN>){
	$IN = $_;
	$IN =~ s/ +//g;
	$sum += 1;
	if( exists($count_hash{lc($IN)})){
		next
	}
	else{
		$count_hash{lc($IN)} = 1;
		$count += 1;
	}
	if ($count == $num){
		print "$num distinct lines seen after $sum lines read.\n";
		exit;}}

if ($count < $num){
	print "End of input reached after $sum lines read - $num different lines not seen.\n";}
