#!/usr/bin/python3
import sys
from sys import argv

num = int(argv[1])
A=[]
count = 0
for i in sys.stdin:
    i = i.lower()
    L = i.split( )
    string = ' '.join(L)
    if string not in A:
        A.append(string)
    count += 1
    if len(A) == num :
        print("{} distinct lines seen after {} lines read.".format(num, count))
        break

if len(A) < num:
    print("End of input reached after {} lines read -  {} different lines not seen.".format(count,num))
