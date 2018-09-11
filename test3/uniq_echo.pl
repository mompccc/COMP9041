#!/usr/bin/perl -w

@Name = @ARGV;
foreach $value (@Name){
	if( exists($count_hash{$value})){
		next;
	}
	else{
		$count_hash{$value} = 1;
		print "$value ";
	}
}

print "\n";
