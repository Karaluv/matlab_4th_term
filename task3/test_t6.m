clear;
rng default;
theta = rand([50, 1]) * 2 * pi;
phi = rand([50, 1]) * pi;
x = cos(theta) .* sin(phi);
y = sin(theta) .* sin(phi);
z = cos(phi);

DT = delaunayTriangulation(x, y, z);



[T, Xb] = freeBoundary(DT);
TR = triangulation(T, Xb);

t6(TR)