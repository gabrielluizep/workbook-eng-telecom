clear all; close all; clc;

N = 1e6;

mu = [0;0;0;0];
C = [1 1 0 0; 1 2 0 0; 0 0 3 3; 0 0 3 4];

vetX = mvnrnd(mu, C, N);
X1 = vetX(:,1);
X2 = vetX(:,2);
X3 = vetX(:,3);
X4 = vetX(:,4);

% a) Pr[2 <= X <= 3]
a_sim = mean(2 <= X1 & X1 <= 3)
a_teo = normcdf((3-0)/1) - normcdf((2-0)/1)
printf("\n")

% b) Pr[2 <= X1 <= 3 | X2 = 2]

XcondB = X1(1.9 <= X2 & X2 <= 2.1);

b_sim = mean(2 <= XcondB & XcondB <= 3)
b_teo = normcdf((3-1)/sqrt(1/2)) - normcdf((2-1)/sqrt(1/2))
printf("\n")

% c) Pr[2 <= X1 <= 3 | X2 = 2, X3 = 1]

XcondC = X1(1.9 <= X2 & X2 <= 2.1 & 2.9 <= X3 & X3 <= 3.1);

c_sim = mean(2 <= XcondC & XcondC <= 3)
c_teo = b_teo
printf("\n")

% d) Pr[X2 + X4 > 4]

d_sim = mean(X2 + X4 > 4)
d_teo = 1 - normcdf((4-0)/sqrt(6))