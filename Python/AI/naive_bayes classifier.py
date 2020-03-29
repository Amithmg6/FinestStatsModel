# -*- coding: utf-8 -*-
"""
Created on Sun Mar 29 12:10:16 2020
Navie bayes classifier model

"""

import numpy as np
import matplotlib.pyplot as plt
from sklearn.naive_bayes import GaussianNB
from sklearn import model_selection

# input file
input_file= 'https://raw.githubusercontent.com/PacktPublishing/Artificial-Intelligence-with-Python/master/Chapter%2002/code/data_multivar_nb.txt'

# loading the imput file
data = np.loadtxt(input_file, delimiter=',')
x, y = data[:, :-1], data[:, -1]

# assuming the values in each class follow gaussian distribution

classifier = GaussianNB()

# train the classifier
classifier.fit(x, y)

# run classifier on training data
y_pred = classifier.predict(x)

# comparing the pred vs actual
accuracy = 100 * (y==y_pred).sum() / x.shape[0]
print('Accuracy of the classifier is: ', accuracy,"%")


def visualize_classifier(classifier, X, y):
    min_x, max_x = X[:, 0].min() - 1.0, X[:, 0].max() + 1.0
    min_y, max_y = X[:, 1].min() - 1.0, X[:, 1].max() + 1.0

    # Define the step size to use in plotting the mesh grid 
    mesh_step_size = 0.01

    # Define the mesh grid of X and Y values
    x_vals, y_vals = np.meshgrid(np.arange(min_x, max_x, mesh_step_size), np.arange(min_y, max_y, mesh_step_size))

    # Run the classifier on the mesh grid
    output = classifier.predict(np.c_[x_vals.ravel(), y_vals.ravel()])

    # Reshape the output array
    output = output.reshape(x_vals.shape)

    # Create a plot
    plt.figure()

    # Choose a color scheme for the plot 
    plt.pcolormesh(x_vals, y_vals, output, cmap=plt.cm.gray)

    # Overlay the training points on the plot 
    plt.scatter(X[:, 0], X[:, 1], c=y, s=75, edgecolors='black', linewidth=1, cmap=plt.cm.Paired)

    # Specify the boundaries of the plot
    plt.xlim(x_vals.min(), x_vals.max())
    plt.ylim(y_vals.min(), y_vals.max())

    # Specify the ticks on the X and Y axes
    plt.xticks((np.arange(int(X[:, 0].min() - 1), int(X[:, 0].max() + 1), 1.0)))
    plt.yticks((np.arange(int(X[:, 1].min() - 1), int(X[:, 1].max() + 1), 1.0)))

    plt.show()

visualize_classifier(classifier,x,y)

# spliting the data into test and train

x_train, x_test, y_train, y_test = model_selection.train_test_split(x, y, test_size=0.2, random_state=3)
classifier_new = GaussianNB()
classifier_new.fit(x_train, y_train)

# run classifier on training data
y_test_pred = classifier_new.predict(x_test)

# comparing the pred vs actual
accuracy = 100 * (y_test==y_test_pred).sum() / x_test.shape[0]
print('Accuracy of the classifier is: ', accuracy,"%")

visualize_classifier(classifier, x_train, y_train)
visualize_classifier(classifier_new, x_test, y_test)

""" Using inbuilt functions to find the
accuracy
precision
recall

THREE FOLD CROSS VALIDATION
"""

num_folds = 3

accuracy_values = model_selection.cross_val_score(classifier, x, y, scoring='accuracy', cv=num_folds)
print("Accuracy: " ,str(round(100*accuracy_values.mean(), 2)))

precision_values = model_selection.cross_val_score(classifier, x, y, scoring='precision_weighted', cv=num_folds)
print("precision: " ,str(round(100*precision_values.mean(), 2)))

recall_values = model_selection.cross_val_score(classifier, x, y, scoring='recall_weighted', cv=num_folds)
print("recall: " ,str(round(100*recall_values.mean(), 2)))





























