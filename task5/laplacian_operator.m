function L = laplacian_operator(xx, yy)

    % xx and yy are 2D matrices of x and y coordinates for shape

    % L is the Laplacian operator for the shape

    dx = xx(1, 2:end) - xx(1, 1:end-1);
    dy = yy(2:end, 1) - yy(1:end-1, 1);

    %    Dxx = (1 / (hx ^ 2)) * spdiags([-2 * ones(Nx * Ny, 1), ones(Nx * Ny, 1), ones(Nx * Ny, 1)], [-Nx, 0, Nx], Nx * Ny, Nx * Ny);
    %    Dyy = (1 / (hy ^ 2)) * spdiags([-2 * ones(Nx * Ny, 1), ones(Nx * Ny, 1), ones(Nx * Ny, 1)], [-1, 0, 1], Nx * Ny, Nx * Ny);
    %    D = Dxx + Dyy;

    % rewrite following code to work properly for non-square matrices

    Dxx = spdiags([-2 * ones(size(xx, 1) * size(xx, 2), 1), ones(size(xx, 1) * size(xx, 2), 1), ones(size(xx, 1) * size(xx, 2), 1)], [-size(xx, 1), 0, size(xx, 1)], size(xx, 1) * size(xx, 2), size(xx, 1) * size(xx, 2));
    Dxx = Dxx / (dx(1) ^ 2);

    Dyy = spdiags([-2 * ones(size(yy, 1) * size(yy, 2), 1), ones(size(yy, 1) * size(yy, 2), 1), ones(size(yy, 1) * size(yy, 2), 1)], [-1, 0, 1], size(yy, 1) * size(yy, 2), size(yy, 1) * size(yy, 2));
    Dyy = Dyy / (dy(1) ^ 2);

    L = Dxx + Dyy;

end
