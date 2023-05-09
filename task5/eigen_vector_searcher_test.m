
% function V = eigen_vector_searcher(A, lambda)

% test following function

% generate a random matrix with real eigenvalues

A = rand(5,5);

A = A*A';

% find the eigenvalues of A

[V, D] = eig(A);

% add noise to the eigenvalues
D_noised = D + diag(rand(5,1)*0.0000001);

% find the eigenvalues of the noised matrix
V_noised = zeros(5,5);
for i = 1:5
    i
    lambda = D_noised(i,i);
    V_noised(:,i) = eigen_vector_searcher(A, lambda);
end

