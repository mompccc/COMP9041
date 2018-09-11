#!/usr/bin/perl -w

$A = $ARGV[0];
$total = 0;
$count = 0;
foreach $file (glob "lyrics/*.txt"){
	open(DATA, "<$file") or die;
	@lines = <DATA>;
	chomp @lines;
	foreach $word (@lines){
		$word =~ s/[^a-zA-Z ]/ /g;
		$word =~ s/ +/ /g;
		$word =~ s/^ //g;
		$word =~ s/ $//g;
		@string = split(/ /, $word);
		$total += ($#string+1);
		foreach $B (@string){
			$B =~ s/ *//g;
			if (lc($A) eq lc($B)){
				$count += 1;}}}
	@name = split(/\//, $file);
	$N= $name[1];
	$N=~s/.txt//g;
	$N=~s/_/ /g;
	printf "%4d/%6d = %.9f %s\n", ($count, $total, $count/$total, $N);
	$total = 0;
	$count = 0;
}
