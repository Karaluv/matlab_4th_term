n = 50;
x = rand(n,1);
y = rand(n,1);
z = rand(n,1);
TR = delaunayTriangulation(x,y,z);

% Compute the area of each vertex element
area = t5(TR);
area