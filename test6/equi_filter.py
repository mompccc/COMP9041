#!/usr/bin/python3
import sys


dic = {}
L=[]
for i in sys.stdin:
    line = i.split( )
    new = []
    for word in line:
        A=0
        for j in range(len(word)):
            dic[word[j].lower()] = 0
        for j in range(len(word)):
            dic[word[j].lower()] += 1
        count = dic[word[0].lower()]
        for j in range(len(word)):
            if count != dic[word[j].lower()]:
                A = 1
        for j in range(len(word)):
            dic[word[j].lower()] = 0
        if not A:
            new.append(word)
    lines = ' '.join(new)
    L.append(lines)
for a in L:
    print(a)



