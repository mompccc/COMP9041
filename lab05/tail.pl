#!/usr/bin/perl -w

if (not @ARGV){
	@temp = <STDIN>;
	$N1 = $#temp - 9;
	if ($N1 >= 0){	
		print @temp[$N1..($#temp)];}
	else{
		print @temp;}}
else{
	if ($#ARGV == 0){
		$temp1 = $ARGV[0];
		$temp1 =~s/^.//;
		if ($temp1 =~ m/^\d+$/){
			@temp = <STDIN>;
			$N1 = $#temp - $temp1 + 1;
			if ($N1 >= 0){	
				print @temp[$N1..($#temp)];}
			else{
				print @temp;}}
		else{
			$N=10;
			@filename = @ARGV;
			$num = @filename;
			foreach $file (@filename){
				if ($num > 1){
					print"==> $file <==\n";}
				open(DATA, "<$file") or die "./tail.pl: can't open $file\n";
				@lines = <DATA>;
				$lows = @lines;
				$N1 = $lows - $N;
				if ($N1 >= 0){	
					print @lines[$N1..($lows-1)];}
				else{
					print @lines;}
				close(DATA);}}}
	else{
	$temp1 = $ARGV[0];
	$temp1 =~s/^.//;
	if ($temp1 =~ m/^\d+$/){
		$N = $temp1;
		@A = @ARGV;
		shift(@A);
		@filename = @A;}
	else{
		$N = 10;
		@filename = @ARGV;}

	$num = @filename;

	foreach $file (@filename){
		if ($num > 1){
			print"==> $file <==\n";}
		open(DATA, "<$file") or die "./tail.pl: can't open $file\n";
		@lines = <DATA>;
		$lows = @lines;
		$N1 = $lows - $N;
		if ($N1 >= 0){	
			print @lines[$N1..($lows-1)];}
		else{
			print @lines;}
		close(DATA);}}}
