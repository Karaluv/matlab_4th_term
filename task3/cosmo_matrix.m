function M = cosmo_matrix(P,S)
n = size(P);
n = n(1);
M = zeros(n, n);
for k = 1:n
    for l = 1:n
        if k == l 
            M(k, l) = 2*sqrt(pi*S(l));
        else
        M(k, l) = S(l)/sqrt(sum((P(k, :)- P(l, :)).^2));
        end
    end
end
