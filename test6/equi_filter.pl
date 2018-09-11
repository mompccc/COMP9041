#!/usr/bin/perl -w


@array = <STDIN>;
chomp @array;
foreach $IN (@array){
	@line = split(/ /, $IN);
	foreach $word (@line){
		@temp = split(//, $word);
		foreach $sub (@temp){
			if (exists($count_hash{lc($sub)})){
				$count_hash{lc($sub)} += 1;
			}
			else{
				$count_hash{lc($sub)} = 1;
			}
		}
		$count = $count_hash{lc($temp[0])};
		foreach $sub (@temp){
			if ($count_hash{lc($sub)} != $count){
				$word = 1;}}
		foreach $sub (@temp){
			$count_hash{lc($sub)} = 0;}
	}
	@line =grep(/[^1]/, @line);
	$A = join(" ", @line);
	push @new, $A;
}

foreach $d (@new){
	print "$d\n";}
