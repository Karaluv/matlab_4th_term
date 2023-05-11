% Write an m-function that, for a given 3D triangulated surface, calculates a matrix of inverse distances between all surface vertices (such a matrix describes the electrostatic interaction of a system of point charges located at the surface vertices) (15 points)

function [Rinv] = inverse_distance_matrix(P)
    % P - nx3 matrix with coordinates of n vertices of the triangulated surface mesh

    % Number of vertices
    n = size(P, 1);

    % Initialize matrix of inverse distances
    Rinv = zeros(n, n);

    % Calculate inverse distances
    for i = 1:n

        for j = 1:n

            if i ~= j
                Rinv(i, j) = 1 / norm(P(i, :) - P(j, :));
            end

        end

    end

end
