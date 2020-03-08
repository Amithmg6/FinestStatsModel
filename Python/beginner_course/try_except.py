# -*- coding: utf-8 -*-
"""
Created on Sun Mar  8 10:41:56 2020

@author: Achuth MG
"""


""" now with the try and except statement
when the first conversation fails 
it just drops into the except clause and the progrm continues"""

astr = 'hello'
try:
    istr = int(astr)
except:
    istr = -1

print('first',istr)

astr = '123'
try:
    istr = int(astr)
except:
    istr = -1
print('second',istr)

""" more of the same """

astr = 'bob'
try:
    print('hello')
    istr = int(astr)
    print('there')
except:
    istr = -1
    
print('done',istr)