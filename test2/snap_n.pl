#!/usr/bin/perl -w

$N = $ARGV[0];
while (1){
	@string = <STDIN>;
	chomp @string;
	foreach $value (@string){
		$count_hash{$value} += 1;
		if($count_hash{$value} == $N){
			print "Snap: $value\n";
			exit;
		}
	}
}
