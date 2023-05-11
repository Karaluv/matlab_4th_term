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

% add test for 2*sin(x) + 3*cos(y) + 6*sin(2*x) + 7*cos(2*y) + 6

funcs = {@(x) sin(x(1, :)); @(x) cos(x(2, :)); @(x) sin(2 * x(1, :)); @(x) cos(2 * x(2, :)); @(x) ones(1, size(x, 2))};


N = 1000;

x1 = linspace(0, 10, N);
x2 = linspace(2, 30, N);

y = 2 * sin(x1) + 3 * cos(x2) + 6 * sin(2 * x1) + 7 * cos(2 * x2) + 6;

r = [x1; x2];

% add noise to y 
y_noise = y + 0.1 * randn(size(y));

[P, sgP] = LinApproximator(y_noise, r, funcs);

% plot the results

figure(2); clf; hold on; grid on;

plot3(x1, x2, y_noise, 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot3(x1, x2, P(1) * sin(x1) + P(2) * cos(x2) + P(3) * sin(2 * x1) + P(4) * cos(2 * x2) + P(5), 'r', 'LineWidth', 2);


