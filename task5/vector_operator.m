function V = vector_operator(F, sB, n, xx, yy, lambda)

    % мне сказали что все же ячейки одинаковой формы, поэтому не буду делать как в
    % первом пункте

    % generate matrix for dx and dy for given xx and yy
    dx = xx(2) - xx(1);
    dy = yy(2) - yy(1);

    size = length(xx) * length(yy);

    ddx = spdiags([-ones(size, 1) ones(size, 1)], [0 1], size, size);
    ddx = ddx / dx;

    ddy = spdiags([-ones(size, 1) ones(size, 1)], [0 length(xx)], size, size);
    ddy = ddy / dy;

    % now matrix for d / dx and d / dy type sparse matrix

    % d / dx

    % p = matrix
    % | - d ln(n^2) / d y * d / dy ;   d ln(n^2) / d y * d / dx |
    % |   d ln(n^2) / d x * d / dy ; - d ln(n^2) / d x * d / dx |

    ln_eps = log(n ^ 2);

    p = [- ddy * ln_eps * ddy' ddy * ln_eps * ddx';
         ddx * ln_eps * ddy' - ddx * ln_eps * ddx'];

         
    psi = zeros(2 * size(F,1), 2 * size(F,2));
    % generate even numbers from 1 to 2 * size(F,1)
    psi(size(F,2):end,1:2:end) = F;
    psi(1:size(F,2),2:2:end) = F;

    p = psi' * p * psi;
    M = diag([sB flip(sB)]);

    V = M + p;

end
