# -*- coding: utf-8 -*-
"""
Created on Sun Mar 29 13:13:26 2020
NOT ACCURATE
confusion matrix functions
"""

import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix
from sklearn.metrics import classification_report

# define some labels to work on

true_labels = [2,0,0,2,4,4,1,0,3,3,3]
pred_labels = [2,1,0,2,4,3,1,0,1,3,3]

# create CONFUSION MATRIX
confusion_mat = confusion_matrix(true_labels, pred_labels)

# Visualize confusion matrix
plt.imshow(confusion_mat, interpolation='nearest', cmap=plt.cm.gray)
plt.title('Confusion matrix')
plt.colorbar()
ticks = np.arange(5)
plt.xticks(ticks, ticks)
plt.yticks(ticks, ticks)
plt.ylabel('True labels')
plt.xlabel('Predicted labels')
plt.show()
