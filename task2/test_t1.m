points_matrix = rand(2,10);

% Call the function to get the triangulation and boundary points
[TR, boundaryPoints, boundaryPointsIndexes] = t1(points_matrix);

% Plot the result
title('Triangulation with Boundary Points');
xlabel('X');
ylabel('Y');
legend('Triangulation', 'Boundary Points');