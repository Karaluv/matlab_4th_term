x = linspace(-1, 1, 50);
y = linspace(-1, 1, 50);
[xx, yy] = meshgrid(x, y);

% Define the refractive index distribution on the working area
n = 1 + 0.2*exp(-(xx.^2 + yy.^2)/0.1^2);

% Define the wavelength in vacuum
lambda = 0.5;

% Calculate the operator matrix
D = scalar_operator(xx, yy, n, lambda);

% Define the source function
f = exp(-((xx-0.3)/0.1).^2 - ((yy+0.4)/0.1).^2);

% Solve the scalar wave equation using the operator matrix
u = D\f(:);

% Reshape the solution to a matrix
u = reshape(u, size(n));

% Plot the solution
figure;
surf(xx, yy, abs(u));
xlabel('X');
ylabel('Y');
zlabel('|U|');
title('Scalar Wave Equation Solution');