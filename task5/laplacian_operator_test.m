% test funtion which takes 
% xx,yy - matrices for partitioning the workspace of a rectangular shape

% and calculates laplacian matrix for the given shape

% create a rectangular shape with 5x5 cells
xx = [0 1 3 4 5];
yy = [0 1 2 3 4 7]';

% now make a meshgrid for the given shape
[xx,yy] = meshgrid(xx,yy);


% calculate laplacian matrix for the given shape

res = laplacian_operator(xx,yy);

% res is a sparse matrix

% plot the matrix

spy(res)