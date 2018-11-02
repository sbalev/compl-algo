#!/usr/bin/python

import random
import time

def randomlist(n) :
    x = []
    for _ in range(n) :
        x.append(int(random.uniform(-100, 100)))
    return x

def calc2(x, n) :
    maxs = 0
    for l in range(n) :
        s = 0
        for r in range(l, n) :
            s += x[r]
            maxs = max(s, maxs)
    return maxs

nmax = 100000
nstep = 1000
x = randomlist(nmax)
for n in range(nstep, nmax + nstep, nstep) :
    start = time.time()
    calc2(x, n)
    t2 = time.time() - start
    print("%10d%10.2f" % (n, t2))
