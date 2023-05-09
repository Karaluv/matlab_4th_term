xx = [0 1 0.5];
yy = [0 0 1];
tr = [1 2 3]';

L = laplacian_operator_triangulation(xx,yy,tr);

spy(L);

% for bigger triangulations test

xx = rand(100,1);
yy = rand(100,1);

tr = delaunay(xx,yy);

L = laplacian_operator_triangulation(xx,yy,tr);

spy(L);