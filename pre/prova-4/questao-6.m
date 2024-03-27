close all; clear all; clc;

N = 1e5;

X1 = randi([0 1], 1, N); X1(X1 == 0) = -1;
X2 = randi([0 1], 1, N); X2(X2 == 0) = -1;
X3 = randi([0 1], 1, N); X3(X3 == 0) = -1;

Y1 = X1;
Y2 = X1 .* X2;
Y3 = X1 .* X2 .* X3;

% Média de Y
muY_sim = mean([Y1' Y2' Y3'])'
muY_teo = [0; 0; 0]

% Covariância de Y
covY_sim = cov([Y1' Y2' Y3'])
covY_teo = [1 0 0; 0 1 0; 0 0 1]

Z1 = Y1 + Y2;
Z2 = Y2 + Y3; 
Z3 = Y3 + Y1;

% Média de Z
muZ_sim = mean([Z1' Z2' Z3'])'
muZ_teo = [0; 0; 0]

% Covariância de Z
covZ_sim = cov([Z1' Z2' Z3'])
covZ_teo = [2 1 1; 1 2 1; 1 1 2]