# -*- coding: utf-8 -*-
"""
Created on Sun Mar  8 15:56:06 2020

@author: Achuth MG
"""

""" A parameter is a variable which we use in the function definition.
    it is handle that allows the code in the function to access the 
    arguments for a particular function invocation. """
    

def greet(lang):
    if lang == 'es':
        print('hola')
    elif lang == 'fr':
        print('Bonjour')
    else:
        print('hello')


greet('an')
greet('es')
