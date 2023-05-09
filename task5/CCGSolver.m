function [x] = CCGSolver(A,b,rmin)
%CCGSOLVER решение A*x = b  методом сопряжённых градиентов
%   

rk = b;
pk = b;
x  = zeros(length(b),1);
k = 0;
while((norm(rk)>rmin)&&(k<1e4))
    k = k+1;
    z = A*pk;
    hk = sum(rk.^2);
    nk = hk./(pk'*z);
    yk = pk.*nk;
    x = x + yk;
    z = z.*nk;
    rk = rk - z;
    pk = pk.*(sum(rk.^2)./hk);
    pk = pk + rk;
end

end
