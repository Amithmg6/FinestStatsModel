# -*- coding: utf-8 -*-
"""
Created on Sun Mar  8 10:57:04 2020

@author: Achuth MG
"""

""" exercise:
    
    rewrite your pay computation to give the 
    employee 1.5 times the hourly rate for 
    hours worked above 40 hours          
    Enter hours: 45
    enter rate: 10
    pay: 475.0

    """

hours = input('enter hours:')
hours = int(hours)
rate = input('rate:')
rate = int(rate)

if hours <= 40:
    pay = hours * rate
    print('pay is:',pay)
elif hours > 40:
    pay = 40 * rate + (hours - 40) * 1.5
    print('pay with OT is:',pay)
else:
    print('done')
    
