# -*- coding: utf-8 -*-
"""
Created on Sun Mar 29 18:51:23 2020

Building a single variable regressor
"""

import pickle
import numpy as np
from sklearn import linear_model
import sklearn.metrics as sm
import matplotlib.pyplot as plt

input_file = 'data_singlevar_regr.txt'
data = np.loadtxt(input_file, delimiter=',')
