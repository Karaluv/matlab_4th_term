% run tube_distr.m first to generate the nn xx yy

lambda = 1e-6;

D = scalar_operator(xx, yy, nh, lambda);

% plot the result
spy(D)