function [P,F,S,N,C] = my_surf(XYZ,types)

sz = size(XYZ);
n = sz(1);
    
fid = fopen('molecule.xyz','w');
fprintf(fid,'%d \n',n);
fprintf(fid,'%s \n','MATLAB');
for ii = 1:n
    fprintf(fid,'%s %16.10f %16.10f %16.10f \n', types{ii}, XYZ(ii,1), XYZ(ii,2) ,XYZ(ii,3));
end
fclose(fid);

system('tagss.exe');

P = load('points.dat');
F = load('triangles.dat')+1;
%E = load('edges.dat')+1;
S = load('squares.dat');
N = load('normals.dat');
C = load('colors.dat');
%PF= load('p_triangles.dat')

[Fv,Pv] = surf_voron(P,N,F);

figure; 
hold on; 
grid on; 
axis equal; 
patch('Faces',F,'Vertices',P,'FaceVertexCData',C,'VertexNormals',N,'VertexNormalsMode','manual','FaceAlpha',1,'FaceColor','interp','EdgeColor','interp');

for ii = length(Fv):-1:1
    patch('Faces',Fv{ii},'Vertices',Pv,'FaceColor','none','EdgeColor',[ 0 0 0]);
end

xlabel('X [Angst]');
ylabel('Y [Angst]');
zlabel('Z [Angst]');
%camorbit(20,0);
%shading interp;
lighting gouraud