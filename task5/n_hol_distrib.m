% скрипт вычисления поперечного распределения показателя преломления 
% для модели дырчатой оболочки и заполненной жилы

n1 = 1.33;% показатель преломления (стекло)
a = 1; % радиус дырки - в мкм
b = 10; % расстояние между дырками - в мкм
Na = 2; % размер полости
Nb = 15; % размер области трубчатой оболочки

Rmax = 50; % размер расчётной области (половина)
h    = 0.1; % шаг сетки - одинаковый в по x и y

x0 = b.*0 % смещение области жилы по x относительно начала координат;
y0 = 0.*b; % смещение области жилы по y относительно начала координат;

x = [-Rmax:h:Rmax]; % сетка разбиения рабочей области вдоль одного направления
[xx,yy] = meshgrid(x,x); % сетка разбиения на плоскости

d = 0.04; % параметр сглаживания границы полости (чем меньше,тем граница резче)

% определение места расположения жилы:
Xc = x0;
Yc = y0;

% можно описать не одну , а несколько областей жилы
% две жилы:
Xc = [x0 -x0];
Yc = [y0 -y0];

% smooth_hole(a,d,xc,yc,xx,yy) - функция вычисления распределения для
% отдельной полости
smf = @(a,xc,yc,xx,yy) smooth_hole(a,d,xc,yc,xx,yy); % сохраняем указатель на функцию вычислиений отдельной трубочки

% hol_set_shift(smf,xx,yy,Xc,Yc,n1,a,b,Na,Nb); - функция вычисление
% распредления показателя преломления для всей области
nn = hol_set_shift(smf,xx,yy,Xc,Yc,n1,a,b,Na,Nb); % построение распределения показателя преломления для системы трубочек
 
% рисование распредления
figure;
hold on;
grid on;
surf(xx,yy,nn);
shading interp;