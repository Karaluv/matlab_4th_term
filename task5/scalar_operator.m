function D = scalar_operator(xx,yy,nn,lambda)

    
    % \Delta_{x,y} (F_n) + k^2 n^2 F_n = \beta^2 F_n
    % D = \Delta_{x,y} + k^2 n^2
    
    E = reshape(nn.^2,1,[]);
    k = 2*pi/lambda;

    [m,n] = size(xx);
    D = sparse(m*n,m*n);

    
    Delta = laplacian_operator(xx,yy);
    size(Delta);
    size(nn);

    D =Delta + k^2 * spdiags(E',0,m*n,m*n);

end