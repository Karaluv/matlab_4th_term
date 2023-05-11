% y = zeros(1, length(funcs));
% for k = 1:length(funcs)
%     f = funcs{k};
%     y(1, k) = f(2);
% end

r = linspace(1, 10, 10);
y = 3 * linspace(1, 10, 10);
%funcs = [{@(x) (x^2)}, {@(x) (x^3)}, {@(x) (x)}];
funcs = {@(x) (sin(x)); @(x) (cos(x)); @(x) (x)};
fun = @(x, P) (P(1)*sin(x) + P(2)*cos(x) + P(3)*x);
[P, Errors] = NonLinApproximator(y, r, fun, 3)
[P, Errors] = LinApproximator(y, r, funcs)

%M = length(funcs);