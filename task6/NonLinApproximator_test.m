a = 0.1;
b = 0.2;
c = 0.3;

x = 0:0.1:10;
y = a*exp(-b*x)+c;

r = x;
fun = @(r,P) P(1).*exp(-P(2)*r)+P(3);

[P, sgP] = NonLinApproximator(y, r, fun, 3);

figure(1);
plot(x, y, 'o', x, fun(x, P), 'r');
legend('experimental data', 'approximation');
xlabel('x');
ylabel('y');
title('Nonlinear approximation');

str = sprintf('a = %f +- %f\nb = %f +- %f\nc = %f +- %f', P(1), sgP(1), P(2), sgP(2), P(3), sgP(3));
disp(str);

% for fitting sin

a = 1;
b = 1;
c = 0;

x = 0:0.1:10;
y = a*sin(b*x)+c;

r = x;
fun = @(r,P) P(1).*sin(P(2)*r)+P(3);

[P, sgP] = NonLinApproximator(y, r, fun, 3);

figure(2);
plot(x, y, 'o', x, fun(x, P), 'r');
legend('experimental data', 'approximation');
xlabel('x');
ylabel('y');
title('Nonlinear approximation');

str = sprintf('a = %f +- %f\nb = %f +- %f\nc = %f +- %f', P(1), sgP(1), P(2), sgP(2), P(3), sgP(3));
disp(str);