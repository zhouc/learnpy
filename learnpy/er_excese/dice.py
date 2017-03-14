#!/usr/bin/env python 
import random
for x in range(1,11):
        throw_1 = random.randint(1,6)
        throw_2 = random.randint(1,6)
        total = throw_1 + throw_2
        print(total)
        if total == 7:
                print('Seven Thrown!')
        if total == 7:
                print('Seven Thrown!')
        if throw_1 == throw_2:
                print('Double Thrown!')