#!/usr/bin/perl -w


@string = <STDIN>;
chomp @string;
foreach $context (@string){
	$context =~ tr/A-Z/a-z/;
	$context =~ s/s$//;
	$context =~ s/ +/ /g;}

foreach $d (@string){
	$C = $d;
	$C =~ s/\d*//g;
	$C =~s/^ +//;
	$C =~s/ +$//;
	push @Name, $C;
}

foreach $value (@Name){
	if( exists($count_hash{$value})){
		next;
	}
	else{
		$count_hash{$value} = 1;
		push(@new, $value);
	}
}

@sorted = sort @new;

foreach $name (@sorted){
	$sum = 0;
	$count = 0;
	foreach $data (@string){
		$B = $data;
		@a= split(/ /, $data);
		$A=$a[0];
		$B =~ s/\d*//g;
		$B =~s/^ +//;
		$B =~s/ +$//;
		if ($B eq $name){
			$count ++;
			$sum = $sum + $A;}
	}
	print "$name observations: $count pods, $sum individuals\n";
}
