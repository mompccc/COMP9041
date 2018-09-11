#!/usr/bin/perl -w

$file = $ARGV[0];
open(DATA, "<$file") or die;
@lines = <DATA>;
chomp @lines;

for $line (@lines){
	$line =~ s/\t+//;
	if ($line eq "#!/bin/bash"){
		print "#!/usr/bin/perl -w\n";}
	elsif ($line =~ /[a-zA-Z]+=\d+/){
		@temp = split(/=/, $line);
		$A = $temp[0];
		$B = $temp[1];
		print "\$$A = $B;\n";}
	elsif ($line =~ /[a-zA-Z]+=\$[a-zA-Z]+/){
		@temp = split(/=/, $line);
		$A = $temp[0];
		$B = $temp[1];
		print "\$$A = $B;\n";}
	elsif ($line =~ /echo.*/){
		$line =~ s/^ +//;
		$word = substr($line, 5);
		print "print \"$word\\n\"\n";}
	elsif ($line =~ /while.*/){
		$line =~ s/\(\(/\( /;
		$line =~ s/\)\)/ \)/;
		$line =~ s/^ +//;
		$line = substr($line, 6);
		@temp = split(/ /, $line);
		foreach $sub (@temp){
			if ($sub =~ /[a-zA-Z]+/){
				$sub = "\$$sub";}}
		print "while @temp ";}
	elsif ($line =~ /if.*/){
		$line =~ s/\(\(/\( /;
		$line =~ s/\)\)/ \)/;
		$line =~ s/^ +//;
		$line = substr($line, 3);
		@temp = split(/ /, $line);
		foreach $sub (@temp){
			if ($sub =~ /[a-zA-Z]+/){
				$sub = "\$$sub";}}
		print "if @temp "}
	elsif ($line =~ /[a-zA-Z]+=\$\(\(.*\)\)/){
		$line =~ s/\(\(/ /;
		$line =~ s/\)\)/ /;
		$line =~ s/=/ =/;
		$line =~ s/\$//;
		@temp = split(/ /, $line);
		foreach $sub (@temp){
			if ($sub =~ /[a-zA-Z]+/){
				$sub = "\$$sub";}}
		print "@temp;\n";}
	elsif (($line eq "do") or ($line eq "then")){
		print "{\n";}
	elsif (($line eq "done") or ($line eq "fi")){
		print "}\n";}
	elsif ($line eq "else"){
		print "} else {\n";}
	else{
		print $line, "\n";}
}
