% cosmo_matrix tests

%P - nx3 matrix with triangulated grid vertex coordinates. n - number of vertices
% S - nx1 vector with area values of surface features.
% M is an nxn matrix that determines the potential at the grid vertices by the values of the charges in them.
% The figure on the right shows a fragment of a triangulated mesh with outlined surface feature edges around each vertex.

% plot it

n = 20;

x = rand(n,1);
y = rand(n,1);
z = rand(n,1);

% create a random 3d triangulation
tr = delaunayTriangulation(x,y,z);
P = tr.Points;

S = rand(n,1);

M = cosmo_matrix(P,S);