#!/usr/bin/perl -w

$name = $ARGV[0];
open DATA, '-|', "wget -q -O- http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html";
@lines = <DATA>;
foreach $line (@lines){
	if ($line =~ /$name\d{4}<.*><.*>/){
		$line =~ s/$name\d{4}.html//g;
		$line =~ s/[^$name\d{4}]//g;
		print $line,"\n";}}
