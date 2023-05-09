nx = 11;
ny = 11;
x = linspace(0,1,nx);
y = linspace(0,1,ny);
[X,Y] = meshgrid(x,y);
P = [reshape(X,nx*ny,1),reshape(Y,nx*ny,1)];
noise = randn(size(P))*0.01; % add gaussian noise with std deviation of 0.01
P = P + noise*100;

% Create triangulation
T = delaunayTriangulation(P);

% Plot mesh
triplot(T,'k');
axis equal;

spy(t3(T))

