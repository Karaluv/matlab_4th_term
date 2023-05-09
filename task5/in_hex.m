function [isinhex] = in_hex(r,xc,yc)
%IN_HEX проверяет принадлежность точек к шестиуголнику размера r
% r - рахмер шестиугольника (радиус описанной окружности)
% xc, yc - координаты точек

isinhex = zeros(size(xc));

rc = sqrt(xc.^2+yc.^2);

h = r.*sqrt(3)./2; % радиус вписанной окружности
ind = find(rc<=r); % сразу найдем все точки что режат внутри вписаноой окружности
ind1 = find(rc(ind)<h);
ind1 = ind(ind1);
isinhex(ind1) = 1;
% далее выделми "пограничный" слой
ind1 = find(rc(ind)>=h);
ind = ind(ind1); % пограничный слой 


for ii = 1:length(ind)
   alf = atan2(yc(ii),xc(ii)); % угол между осью x и направлением на текущую точку
   na = alf./(pi./6); % далее ищем ближайшую высоту из центра на сторну шестиуголльника 
   da = alf - round(na).*pi./6;
   if (rc(ii).*cos(da)<h) % проверяем проекцию и сохраняем подходящие
       isinhex(ind(ii)) = 1;
   end
end

end

