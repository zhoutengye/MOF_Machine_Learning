import math

from matplotlib import cm
from matplotlib import gridspec
from matplotlib import pyplot as plt
import numpy as np
import sklearn
from sklearn import metrics
from sklearn import linear_model


# Load Training Date and test data
f = np.loadtxt('MOF_Training.dat',unpack='true')
f2 = np.loadtxt('MOF_test.dat',unpack='true')

# X: training input data    y: training output data
# X2: test inut data 
# (It is weird that although I put 0:3 and 3:6, it is actually actually 0:2, 3:5 columns.
#    Not sure if there is somthing wrong on my laptop) 
X = np.transpose(f[3:6,:])
y = np.transpose(f[0:3,:])
# to change the range of test data, sinply change the subscripts or import other data.
X2 = np.transpose(f2[3:6,100:110])

# sklean stuff
lm = linear_model.LinearRegression()

# Linear fit
lm.fit(X,y)

# predict the results with test data input
y2 = lm.predict(X2)

# peint(regr.coef_)

 
print(' Input X Centroid, Y centroid, Area')
print(X2)
print(' ')

# print norm X norm, Y norm, Intersecpt predicted by Linear Regression
print(' predicted norm X norm, Y norm, Intersecpt')
print(y2) 
print(' ')

# print exact norm X norm, Y norm, Intersecpt
print(' exact norm X norm, Y norm, Intersecpt')
print(np.transpose(f2[0:3,100:110]))
print(' ')