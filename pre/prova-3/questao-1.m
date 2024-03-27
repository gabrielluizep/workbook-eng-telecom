clear all; close all; clc;

N = 100000;  % Número de realizações

X = zeros(1, N);
Y = zeros(1, N);

i = 1;
while i <= N
  X(i) = 20 * rand() - 10; % x in [-10 10]
  Y(i) = 10 * rand();      % y in [0 10]

  if not (Y(i) > 10 - abs(X(i))) 
    i = i + 1;
  end
end

PrXgeqY_sim = mean(X>=Y)
PrXgeqY_teo = 1/4

% figure; hold on; grid on;
% scatter(X, Y);
% ylim([-1 11]); xlim([-11 11]);
% xlabel('x'); ylabel('y');
% axis('square')

dy = 0.1; y = -1 : dy : 11;

pdfY_sim = hist(Y, y) / (N * dy);
pdfY_teo =  (1/5 - y/50) .* (0 <= y & y <= 10) + 0 .* (y > 10 | y < 0);

figure
subplot(3, 1, 1); grid on; hold on;
bar(y, pdfY_sim, 'y');
plot(y, pdfY_teo, 'b', 'LineWidth', 3);
xlabel('y'); ylabel('f_Y(y)');

cdfY_sim = cumsum(pdfY_sim) * dy;
cdfY_teo = (y/5 - y.^2/100) .* (0 <= y & y <= 10) + 0 .* (y<0) + 1 .* (y > 10);

subplot(3, 1, 2); grid on; hold on;
plot(y, cdfY_sim, 'y', 'LineWidth', 3);
plot(y, cdfY_teo, 'b--', 'LineWidth', 2);
xlabel('y'); ylabel('F_Y(y)');
xlim([-1 11]); ylim([-0.2, 1.2]);

dx = 1; idx = (5 - dx <= X) & (X <= 5 + dx);
pdfY_condX_sim = hist(Y(idx), y) / (sum(idx) * dy);
pdfY_condX_teo = 1/5 .* (0 <= y & y <= 5);

subplot(3, 1, 3); grid on; hold on;
bar(y, pdfY_condX_sim, 'y');
plot(y, pdfY_condX_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('F_Y(y | X = 5)');

rhoXY_sim = cov(X, Y) / sqrt(var(X) * var(Y))
covXY_teo = 0