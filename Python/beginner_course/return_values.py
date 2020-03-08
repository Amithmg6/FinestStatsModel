# -*- coding: utf-8 -*-
"""
Created on Sun Mar  8 16:01:17 2020

@author: Achuth MG
"""


""" return values """

def greet():
    return "hello"

print(greet(), "amith")

def greet(lang):
    if lang == 'es':
        return 'hola'
    elif lang == 'fr':
        return 'Bonjour'
    else:
        return 'hello'
    
print(greet('en'), "amith")
print(greet('fr'), "amith")
print(greet('es'), "amith")

""" multiple parameters """

# 1. match the number and order of arguments and parameters 

def add(a,b):
    added = a+b
    return added

x = add(109234,12389)
print(x)