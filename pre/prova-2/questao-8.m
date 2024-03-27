close all; clear all; clc;
pkg load statistics;

N = 1e5;

U1 = randi([0 2], 1, N);
U2 = randi([0 2], 1, N);
U3 = randi([0 2], 1, N);

X = U1 + U2 + U3;
Y = U1 + U2 - U3;

x = [0 1 2 3 4 5 6];
y = [-2 -1 0 1 2 3 4];


% Conjunta

pmfXY_sim = hist3([X' Y'], {x, y}) / N
pmfXY_teo = [   0      0   1/27      0      0      0      0; 
                0   1/27      0   2/27      0      0      0;
             1/27      0   2/27      0   3/27      0      0;
                0   2/27      0   3/27      0   2/27      0;
                0      0   3/27      0   2/27      0   1/27;
                0      0      0   2/27      0   1/27      0;
                0      0      0      0   1/27      0      0]

% Marginais

pmfX_sim = hist(X, x) / N
pmfX_teo = [1/27 3/27 6/27 7/27 6/27 3/27 1/27]

pmfY_sim = hist(Y, y) / N
pmfY_teo = [1/27 3/27 6/27 7/27 6/27 3/27 1/27]

% Condicionais

pmfX_condY_sim = zeros(length(x), length(y));
for i = 1:length(y)
  XcondY = X(Y == y(i));
  pmfX_condY_sim(i, :) = hist(XcondY, x) / sum(Y == y(i));
end

pmfX_condY_sim
pmfX_condY_teo = [  0   0   1   0   0   0   0;
                    0 1/3   0 2/3   0   0   0;
                  1/6   0 2/6   0 3/6   0   0;
                    0 2/7   0 3/7   0 2/7   0;
                    0   0 3/6   0 2/6   0 1/6;
                    0   0   0 2/3   0 1/3   0;
                    0   0   0   0   1   0   0]

pmfY_condX_sim = zeros(length(y), length(x));
for i = 1:length(x)
  YcondX = Y(X == x(i));
  pmfY_condX_sim(i, :) = hist(YcondX, y) / sum(X == x(i));
end

pmfY_condX_sim
pmfY_condX_teo = [  0   0   1   0   0   0   0;
                    0 1/3   0 2/3   0   0   0;
                  1/6   0 2/6   0 3/6   0   0;
                    0 2/7   0 3/7   0 2/7   0;
                    0   0 3/6   0 2/6   0 1/6;
                    0   0   0 2/3   0 1/3   0;
                    0   0   0   0   1   0   0]

figure; hold on; grid on;
bar(x, pmfX_sim, 'y');
stem(x, pmfX_teo, 'b', 'LineWidth', 3);
xlabel('x'); ylabel('p_X(x)');

figure;
for i = 1 : length(y)
  subplot(4, 2, i); hold on; grid on;
  bar(x, pmfX_condY_sim(i, :), 'y');
  stem(x, pmfX_condY_teo(i, :), 'b', 'LineWidth', 4);
  xlabel('x'); ylabel(sprintf('p_X(x | Y=%d)', y(i)));
end

figure; hold on; grid on;
bar(y, pmfY_sim, 'y');
stem(y, pmfY_teo, 'b', 'LineWidth', 3);
xlabel('y'); ylabel('p_Y(y)');

figure;
for i = 1 : length(x)
  subplot(4, 2, i); hold on; grid on;
  bar(y, pmfY_condX_sim(i, :), 'y');
  stem(y, pmfY_condX_teo(i, :), 'b', 'LineWidth', 4);
  xlabel('y'); ylabel(sprintf('p_Y(y | X=%d)', x(i)));
end