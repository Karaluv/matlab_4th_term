function M = cosmo_matrix(P, S)
    n = size(P, 1);
    M = zeros(n, n);

    % Calculate diagonal elements of M
    for i = 1:n
        % Approximate surface feature around vertex i as a flat round surface
        % element with area S(i) and calculate potential in its middle
        M(i, i) = S(i) / (4 * pi);
    end

    % Calculate non-diagonal elements of M
    for i = 1:n

        for j = i + 1:n
            % Calculate distance between vertices i and j
            r = norm(P(i, :) - P(j, :));

            % Calculate interaction between surface charges at vertices i and j
            M(i, j) = 1 / r;
            M(j, i) = M(i, j);
        end

    end

end
