t = linspace(0, 100*2*pi, 4000);

t = sqrt(t);

x = sqrt(2)*fresnelc(t*sqrt(2)/2);
y = sqrt(2)*fresnels(t*sqrt(2)/2);

plot(x, y);