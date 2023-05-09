function [TR, boundaryPoints, boundaryPointsIndexes] = t1(points_matrix)
    % calculate triangulation
    x = points_matrix(1,:)';
    y = points_matrix(2,:)';

    N = length(x);

    TR = delaunayTriangulation(x,y);

    edges = TR.edges;
    
    boundaryEdgesIndex = freeBoundary(TR);

    % plot them
    hold off;
    triplot(TR, 'color', 'red');
    hold on;
    plot(x(boundaryEdgesIndex), y(boundaryEdgesIndex), "Color",'blue');

    % get data to return

    % find point closest to ox from edge points
    [~, index_min] = min(abs(y(boundaryEdgesIndex)));
    
    % shift to start
    boundaryPointsIndexes = circshift(boundaryEdgesIndex(:,1), - index_min+1 );
    boundaryPoints = points_matrix(:, boundaryPointsIndexes);
end