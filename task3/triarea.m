function A = triarea(P1, P2, P3)
% Calculates the area of a triangle defined by three points
% P1, P2, and P3.

v1 = P2 - P1;
v2 = P3 - P1;
A = 0.5 * sqrt(sum(cross(v1, v2).^2, 2));
end