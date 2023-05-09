function x = eigen_vector_searcher(A, lambda, x0, tol)
    n = size(A, 1);
    % constst
    maxiter = 1000;
    % tol = 1e-2;
    % x0 = ones(n, 1); % initial guess

    % reverse_iteration(A,lambda) returns the eigenvector of A corresponding to the eigenvalue lambda
    n = size(A, 1); % matrix size
    x = x0 / norm(x0); % normalize initial guess

    iter = 0;

    y_pr = A - lambda * eye(n);

    while iter < maxiter
        y = y_pr \ x; % solve (A-lambda I)x=y
        x_old = x;
        x = y / norm(y); % normalize x to make it a unit vector

        if norm(x - x_old) < tol % check for convergence
            break;
        end

        iter = iter + 1;
    end

end
