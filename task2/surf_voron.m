function [Fv,Pv] = surf_voron(P,N,F)
%SURF_VORON Voronoi diagram for vertexes on surface
%   P - matrix Nx3 of vertexes coordinates
%   N - normals for each vertex
%   F - triàngles connectivity
%   Pv - vertexes of voronoi diagram (Mx3)
%   Fv - faces of surface voronoi patches




Pv = (P(F(:,1),:) + P(F(:,2),:) + P(F(:,3),:))./3; % medians of the triangles

lP = size(P);
lP = lP(1);
Pf = cell(lP,1);

lF = size(F);
lF = lF(1);

for ii = 1 : lF
    Pf{F(ii,1)} = [Pf{F(ii,1)} , ii];
    Pf{F(ii,2)} = [Pf{F(ii,2)} , ii];
    Pf{F(ii,3)} = [Pf{F(ii,3)} , ii];
end

for ii = 1 : lP
    pf = Pf{ii};
    p = Pv(pf,:);
    p0 = P(ii,:);
    p = p - p0;
    
    x = p(1,:);
    x = x./norm(x);
    z = N(ii,:);
    y = cross(z,x);
    y = y./norm(z);
    
    qy = p*y';
    qx = p*x';
    
    qq = sqrt(qy.^2+qx.^2);
    qy = qy./qq;
    qx = qx./qq;
    alf = atan2(qy,qx);
    [a,ind] = sort(alf);
    pf = pf(ind);
    Pf{ii}  = pf;
end


lp = zeros(lP,1);
for ii = 1 : lP
    lp(ii) = length(Pf{ii});
end

mlp = min(lp);
xlp = max(lp);

Fv = {};
for ii = mlp:xlp
    ind = find(lp == ii);
    fp = zeros(length(ind),ii);
    for jj = 1:length(ind)
        fp(jj,:) = Pf{ind(jj)};
    end
    Fv{ii - mlp+1} = fp;
end


end

