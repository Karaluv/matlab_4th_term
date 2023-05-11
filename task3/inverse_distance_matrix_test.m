% create some 3d triangulation
x = rand(100,1);
y = rand(100,1);
z = rand(100,1);

dt = delaunayTriangulation(x,y,z);

% get surface
[tri, pts] = freeBoundary(dt);

% plot
trisurf(tri, pts(:,1), pts(:,2), pts(:,3))

Rinv = inverse_distance_matrix(pts)