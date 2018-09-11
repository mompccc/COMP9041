#!/usr/bin/perl -w
open(DATA, "<t1.txt") or die "./tail.pl: can't open t1.txt\n";
@lines = <DATA>;
print @lines;
