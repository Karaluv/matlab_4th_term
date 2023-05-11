function [P, sgP] = NonLinApproximator(y, r, fun, M)

    max_iter = 10000;
    target_precision = 1e-4;
    % alpha = 0.1;
    % betta = 0.9;

    N = length(y);
    K = size(r, 1);

    P  = rand(1, M);
    V = zeros(1, M);

    h = ones(1, M) * 0.1;

    sgP = 1;
    

    loss_function = @(P) sum((y - fun(r, P)) .^ 2);
    
    loss_prev = loss_function(P)*1.01;

    for i = 1:max_iter

        grad = zeros(1, M);

        for j = 1:M
            P1 = P;
            P1(j) = P(j) + h(j);
            grad(j) = (loss_function(P1) - loss_function(P));
        end
        %V = betta * V + alpha * grad;
        %P_new = P - alpha * V;
        P_new = P - grad;

        % find which of the parameters was the most important
        P_temp = P;
        for j = 1:M
            P1 = P;
            P1(j) = P_new(j);
            P_loss(j) = (loss_function(P1) - loss_function(P));

            if P_loss(j) > 0
                h(j) = h(j) * 0.5;
            else
                h(j) = h(j) * 1.2;
                P_temp(j) = P_new(j);
            end
        end

        P = P_temp;

        sgP = sqrt(loss_function(P) / N);

        if sgP < target_precision
            i
            break;
        end


    end


    if sgP > target_precision
        disp('Warning: NonLinApproximator() did not converge to the desired precision.');
    end
    

    sgP = h;



end