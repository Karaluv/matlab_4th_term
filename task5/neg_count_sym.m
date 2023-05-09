function [N] = neg_count_sym(A,z)
%NEG_COUNT_SYM Возвращает число собственных значений матрицы A меньших чем z
%  Матрица A должна быть трехдиагональной и симметричной
%  Метод используется в алгоритме бисекции определения собственных значений
% Использеутся вычисление разложения A-I*z = L'*D*L
% L - верхняя двухдиагональная матрица с единицами на диагонали (явно не вычисляется)
% D - диагональная матрица (польносьтю не сохраняется) 
% вычисление числа собственных значений матрицы A меньших чем z
% определяется как количество диагональных элементов D меньших нуля

n = size(A); % размер матрицы
n = n(1);

a = zeros(n,1); % выделение памяти
b = zeros(n-1,1);
a(:) = diag(A); % элементы главной диагонали заносим в отдельнцй вектор
b(:) = diag(A,1); % элеметры верхней диагонали 



d1 = a(1) - z; % определение первого элемента 

if(d1<0) 
    N = 1; % N - счетчик отрицательных диагональных элементов
else
    N=0;
end
for ii = 2:n
    d2 = a(ii)-z-(b(ii-1).^2)/d1; % итеративное вычисление диагональных элементов
    if(d2<0) 
        N = N+1; 
    end
    d1 = d2; 
end

end

