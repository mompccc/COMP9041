#!/bin/sh

egrep COMP[29]041 $1 | cut -d'|' -f3 | cut -d',' -f2 | cut -d' ' -f2 |tr ' ' -d |sort -n|uniq -c|sort -n|tail -n 1|cut -c9-
