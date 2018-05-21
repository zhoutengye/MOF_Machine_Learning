clear
clc

A  =  load('MOF_Training.dat');
y  = A(:,1:3);
X  = A(:,4:6);

% k = ones(length(X),1);
% X = [k,X];

beta = mvregress(X,y)

