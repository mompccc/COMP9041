#!/usr/bin/perl -w

foreach $name (@ARGV){
	open DATA, '-|', "wget -q -O- http://timetable.unsw.edu.au/current/$name.html";
	@lines = <DATA>;
	foreach $line (@lines){
		$line =~ s/<[^>]*>//gs;
		$line =~ s/^ +//g;
		$line =~ s/ +$//g;
		chomp $line;
		if ($line eq "Teaching Period One"){
			while (not $line eq "SEMESTER ONE CLASSES - Detail"){
				print $line, "\n";}}}
}
