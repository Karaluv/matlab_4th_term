x = linspace(-10, 10, 100);
y = linspace(-10, 10, 100);
[X,Y] = meshgrid(x, y);

R = sqrt(X.^2 + Y.^2);
I = (besselj(1, 0.5*R).^2)./(R.^2);

surf(X, Y, I);

xlabel('x');
ylabel('y');
zlabel('I(x,y)');
title('Surface plot of I(x,y) = besselj_1(0.5*sqrt(x^2+y^2))^2/(x^2+y^2)');