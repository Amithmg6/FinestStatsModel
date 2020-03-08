# -*- coding: utf-8 -*-
"""
Created on Sun Mar  8 16:54:14 2020

@author: Achuth MG
"""

""" loops steps """
n = 5

while n > 0:
    
    print(n)
    n = n-1
print('blastoff')
print(n)

""" breaking out of infinite loop """

while True:
    line = input('> ')
    if line == 'done' :
        break
    print(line)
print('Done!!')