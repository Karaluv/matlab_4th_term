function L = laplacian_operator_triangulation(xx, yy, tr)
    
    % input parameters:
    % xx,yy – vectors of 1 x n coordinate values of triangulated mesh vertices
    % tr - 3 x m matrix of triangle indices

    n = length(xx);
    m = size(tr,2);

    L = sparse(n,n);

    % create edge vector containing all edges in the mesh
    edges_1 = [tr(1,:) tr(1,:) tr(2,:) tr(2,:) tr(3,:) tr(3,:)];
    edges_2 = [tr(2,:) tr(3,:) tr(1,:) tr(3,:) tr(1,:) tr(2,:)]; %3 edges for each triangle 

    for i = 1:length(edges_1)
        % get the coordinates of the two vertices of the edge
        edge_1 = edges_1(i);
        edge_2 = edges_2(i);

        dx = xx(edge_1) - xx(edge_2);
        dy = yy(edge_1) - yy(edge_2);

        Delta = sqrt(dx^2 + dy^2);

        L([edge_1 edge_2],[edge_1 edge_2]) = L([edge_1 edge_2],[edge_1 edge_2]) + ...
            [1 -1;-1 1]/Delta;
    end

    L = L - diag(sum(L,2));
end