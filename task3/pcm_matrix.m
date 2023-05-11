% Write an m-function that, given a 3D triangulated surface, calculates the interaction matrix of surface induced charges located at the surface vertices. In this case, the surface itself is interpreted as a surface describing a cavity inside the dielectric, and surface charges are induced due to the action of an electric field from charges located outside the surface, for example, inside the cavity. (35 points)

% To determine the distribution of induced surface charges, it is necessary to solve the following integral equation:
% (r)=in-ex2(in+ex)i=1mqi((r-ri)n)inr-ri3+(r')((r-r')n)r-r'3dS'
% The following notation is adopted here:
% (r) - surface charge distribution function, r - vector to an arbitrary point on the surface;
% in and ex are the values of the dielectric constant, respectively, inside the cavity with a limited surface and outside it;
% qi - values of point charges - sources of electric field located at points ri, i - ‘sliding’ charge number, m - total number of charges;
% n is the normal vector to the surface at point r.
% The dashed values in the integral refer to the variables over which the integration is carried out.
% In this task, you need to write the matrix of the integral operator. In fact, this operator determines the normal to the surface component of the electric field formed by surface charges. When calculating the matrix of this integral operator, the diagonal element problem arises. But since:
% ((r-r')n)r-r'3dS'dS=((r-r')n)r-r'3dSdS'=drdS'=2S,
% then the diagonal element can be calculated so that the corresponding sum along each column of the desired matrix is equal to 2.
% The format of the m-function is similar to the previous paragraph:
% M = pcm_matrix(P,N,S);
% N - nx3 matrix with coordinates of normals at vertices

function M = pcm_matrix(P, N, S)

    n = size(P, 1);

    M = zeros(n, n);

    D = pdist2(P, P);

    % Loop through every vertex
    for i = 1:n
        % Calculate the surface area of the vertex
        Si = S(i);

        % Calculate the dot product of the normal at the vertex with the vector between the vertex and every other vertex
        Ni_dot_D = dot(repmat(N(i, :), n, 1), (P - repmat(P(i, :), n, 1)), 2);

        % Calculate the interaction term between the vertex and every other vertex
        M(:, i) = (Si ./ (4 * pi * D(:, i))) .* Ni_dot_D;
    end

end
