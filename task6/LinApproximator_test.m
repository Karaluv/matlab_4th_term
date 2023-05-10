K = 2; M = 3;
% f(x,y) = ax + by + c

a = 10; b = 2; c = 3;

funcs = {@(x) x(1, :); @(x) x(2, :); @(x) ones(1, size(x, 2))};

N = 10;

x1 = linspace(0, 1, N);
x2 = linspace(2, 3, N);

r = [x1; x2];

y = a * x1 + b * x2 + c;

[P, sgP] = LinApproximator(y, r, funcs);

% plot the results

figure(1); clf; hold on; grid on;

plot3(x1, x2, y, 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot3(x1, x2, P(1) * x1 + P(2) * x2 + P(3), 'r', 'LineWidth', 2);