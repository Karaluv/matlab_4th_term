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


hold off
trisurf(T, Xb(:, 1), Xb(:, 2), Xb(:, 3), ...
    'FaceColor', 'cyan', 'FaceAlpha', 0.8);
axis equal
hold on



mean_normals = t7(TR);
quiver3(TR.Points(:, 1), TR.Points(:, 2), TR.Points(:, 3), ...
    mean_normals(:, 1), mean_normals(:, 2), mean_normals(:, 3), 0.5, 'color', 'g');
