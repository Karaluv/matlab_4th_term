function L = Laplasian(varargin)
    Nx = varargin{1};
    Lx = varargin{2};
    L = sparse(Nx*Ny*Nz, Nx*Ny*Nz);

    if nargin > 2
        Ny = varargin{3};
        Ly = varargin{4};
    else
        Ny = 1;
        Ly = 0;
    end
    
    if nargin > 4
        Nz = varargin{5};
        Lz = varargin{6};
    else
        Nz = 1;
        Lz = 0;
    end
    
    hx = Lx / Nx;
    hy = Ly / Ny;
    hz = Lz / Nz;


    for k = 1 : Nx*Ny*Nz

        L(k, k) = -2*(1/hx^2 + 1/hy^2 + 1/hz^2);
        
        if k + 1 <= Nx*Ny*Nz
            L(k, k + 1) = 1/hz^2;
        end
        if k + Nz * Ny <=Nx*Ny*Nz
            L(k, k + Nz * Ny) = 1/hx^2;
        end
        if k > Nz * Ny
            L(k, k - Nz * Ny) = 1/hx^2;
        end
        if k > Nz
            L(k, k - Nz) = 1/hy^2;
        end
        if k + Nz <=Nx*Ny*Nz
            L(k, k + Nz) = 1/hy^2;
        end
        if k > 1
            L(k, k - 1) = 1/hz^2;
        end
    end


end
