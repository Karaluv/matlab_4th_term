function [normals] = t6(TR)

    F = faceNormal(TR);

    num_vertices = size(TR.Points, 1);

    mean_normals = zeros(num_vertices, 3);

    vertexIndex = 1;

    for vertexIndex = 1:num_vertices
        triangleIndices = vertexAttachments(TR, vertexIndex);

        mean_normals(vertexIndex, :) = mean(F(triangleIndices{:}, :));
    end

    normals = mean_normals;

end
