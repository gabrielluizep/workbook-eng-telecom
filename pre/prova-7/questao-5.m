close all; clear all; clc;
pkg load statistics;

N = 1000; 
dt = 0.005;
t = 0 : dt : 20;

lambda1 = 2.5;
lambda2 = 2;
lambda_X = lambda1 + lambda2;

X = zeros(N,length(t));
for i = 1 : N
    T = 0;
    while T < t(end)
        T = T + exprnd(1/lambda_X);
        X(i,:) += (t > T);
    endwhile
endfor

muX_sim = mean(X);
muX_teo = lambda_X * t .*(t>=0);

% figure; hold on; grid on;
% plot(t, muX_sim, 'y', 'LineWidth', 4);
% plot(t, muX_teo, 'b', 'LineWidth', 2);

X_10 = X(:,(10/dt)+1);
X_13 = X(:,(13/dt)+1);

Pr_X_10_13_sim = mean(X_10 - X_13  >= 15)
Pr_X_10_13_teo = 0.376729

T = diff(X')';

T_3 = zeros(1, N);
T_2 = zeros(1, N);
for i = 1 : size(T, 1)
    T_3(i) = (find(T(i, :))(3) - 1) * dt;
    T_2(i) = (find(T(i, :))(2) - 1) * dt;
end;

delta3_sim = mean((T_3 - T_2) > 0.1)
delta3_teo = 0.6376

X3 = X(:, (3 / dt) + 1);
X4 = X(:, (4 / dt) + 1);

Cx_sim = [cov(X3, X3) cov(X3, X4);
          cov(X4, X3) cov(X4, X4)]

Cx_teo = [13.5 13.5;
          13.5 18]