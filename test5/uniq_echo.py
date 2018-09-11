#!/usr/bin/python3
from sys import argv

A = []
L = argv[1:]
for i in L:
    if i not in A:
        A.append(i)

for i in A:
    print(i,end=' ')
print()
