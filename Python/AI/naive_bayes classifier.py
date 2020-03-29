# -*- coding: utf-8 -*-
"""
Created on Sun Mar 29 12:10:16 2020
Navie bayes classifier model

"""

import numpy as np
import matplotlib.pyplot as plt
from sklearn.naive_bayes import GaussianNB
from sklearn.model_selection import cross_validate

# input file
input_file= 'https://raw.githubusercontent.com/PacktPublishing/Artificial-Intelligence-with-Python/master/Chapter%2002/code/data_multivar_nb.txt'

# loading the imput file
data = np.loadtxt(input_file, delimiter=',')
x, y = data[:, :-1], data[:, -1]

# assuming the values in each class follow gaussian distribution

classifier = GaussianNB()

# train the classifier
classifier.fit(x, y)








