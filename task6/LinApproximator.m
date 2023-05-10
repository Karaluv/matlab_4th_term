
function [p, sgP] = LinApproximator(y, r, funcs)

K = size(r, 1);
M = size(funcs, 1);
N = size(r, 2);

A = zeros(M, M);
b = zeros(M, 1);

for i = 1:M
    for j = 1:M
        A(i, j) = sum(funcs{i}(r) .* funcs{j}(r));
    end
    b(i) = sum(y .* funcs{i}(r));
end


p = pinv(A) * b;
sgP = zeros(M, 1);

for i = 1:M
    sgP(i) = sqrt(sum((y - funcs{i}(r) * p(i)) .^ 2) / (N - M));
end

end