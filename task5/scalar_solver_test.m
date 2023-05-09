
% generate a random symmetric matrix with eigenvalues in [10 20]
n = 10;

% D = sprandsym(n,0.5,0.5);
% D = 10*D + 20*speye(n);

sb_min = 14;
sb_max = 28;
k_max = 10;
inds = 1:20;

[F, sB] = scalar_solver(D, sb_min, sb_max, k_max, inds);

disp('Eigenvalues:');
disp(sB);
disp('Normalized Eigenvectors:');
disp(F);

[V, eig_zn] = eig(full(D));

disp('Eigenvalues:');
disp(diag(eig_zn)');
disp('Normalized Eigenvectors:');
disp(V);
