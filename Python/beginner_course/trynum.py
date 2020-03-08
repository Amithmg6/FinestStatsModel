# -*- coding: utf-8 -*-
"""
Created on Sun Mar  8 10:52:38 2020

@author: Achuth MG
"""

rawstr = input('enter a number:')
try:
    ival = int(rawstr)
except:
    ival = -1

if ival > 0:
    print('nice work')
else:
    print('not a number')