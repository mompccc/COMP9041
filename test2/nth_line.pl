#!/usr/bin/perl -w

$N = $ARGV[0];
$file = $ARGV[1];

open(DATA, "<$file") or die;
@lines = <DATA>;
if ($N > $#lines+1){
	exit;}
if ($N == 0){
	exit;}
print $lines[$N-1];
