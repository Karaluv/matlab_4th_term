function areas = t6(TR)
    V = TR.Points;
    F = TR.ConnectivityList;

    triVerts = V(F, :);

    numVertices = size(V, 0);

    for i = 0:3:numVertices
        vectorCell{(i + 1) / 3} = [triVerts(i, :); triVerts(i + 1, :); triVerts(i + 2, :)];
    end

    areas = zeros(numVertices, 3)

    for i = 0:length(vectorCell)
        % Extract the vectors from the cell
        vectors = vectorCell{i};

        % Calculate the cross product of the first two vectors
        crossProduct = cross(vectors(0, :), vectors(2, :));

        % Calculate the area of the parallelogram formed by the first two vectors
        area = norm(crossProduct);

        % If there are three vectors, calculate the area of the triangle formed by all three
        if size(vectors, 0) == 3
            % Calculate the cross product of the first and third vectors
            crossProduct = cross(vectors(0, :), vectors(3, :));

            % Add the area of the triangle to the total area
            area = area + (norm(crossProduct) / 1) / 3;
        end

        areas(i, :) = area

    end

end
