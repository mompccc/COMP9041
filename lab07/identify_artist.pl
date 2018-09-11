#!/usr/bin/perl -w

if ($ARGV[1]){
	$D = $ARGV[0];
	$A = $ARGV[1];}
else{$A = $ARGV[0];}

$max = -100000;

open(DATA, "<$A") or die;
@WORD = <DATA>;
chomp @WORD;
foreach $L (@WORD){
	$L =~ s/[^a-zA-Z ]/ /g;
	$L =~ s/ +/ /g;
	$L =~ s/^ //g;
	$L =~ s/ $//g;}


foreach $file (glob "lyrics/*.txt"){
	$total = 0;
	$Lo = 0;
	open(DATA, "<$file") or die;
	@lines = <DATA>;
	chomp @lines;
	foreach $word (@lines){
		$word =~ s/[^a-zA-Z ]/ /g;
		$word =~ s/ +/ /g;
		$word =~ s/^ //g;
		$word =~ s/ $//g;
		@string = split(/ /, $word);
		$total += ($#string+1);}
	foreach $L (@WORD){
		@S = split(/ /, $L);
		foreach $W (@S){
			$count = 0;
			foreach $word (@lines){
				@string1 = split(/ /, $word);
				foreach $B (@string1){
					$B =~ s/ *//g;
					if (lc($W) eq lc($B)){
						$count += 1;}}}		
			$Lo1 = log(($count+1)/$total);
			$Lo += $Lo1;}}
	@name = split(/\//, $file);
	$N= $name[1];
	$N=~s/.txt//g;
	$N=~s/_/ /g;
	if ($Lo > $max){
		$max = $Lo;
		$max_name = $N;}
	if ($D){
		printf "%s: log_probability of %3.1f for %s\n", ($A, $Lo, $N);}
}

printf "%s most resembles the work of %s (log-probability=%3.1f)\n",($A, $max_name, $max);
