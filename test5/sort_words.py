#!/usr/bin/python3
import sys

A=[]
for i in sys.stdin:
    L = i.split( )
    L.sort()
    A.append(' '.join(L))

for a in A:
    print(a)
