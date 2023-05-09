function Y = ortgnlz(Q,X,k)
%ORTGNLZ Ортогоназизация вектора X к k векторам базиса Q
    for ii =1:k
        alf = X'*Q(:,ii); % проекция X на базисный вектор
        X = X - Q(:,ii).*alf; % вычистание проекции 
        X = X./norm(X); % нормирока
    end
    Y = X;
end