#!/usr/bin/perl -w

$file = $ARGV[0];

open(DATA, "<$file") or die;
@lines = <DATA>;

if (not @lines){
	exit;}

if (($#lines+1) % 2 == 0){
	print $lines[$#lines/2], $lines[$#lines/2+1];}
else {
	print $lines[$#lines/2];}
