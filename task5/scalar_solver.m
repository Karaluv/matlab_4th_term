function [F, sB] = scalar_solver(D, sb_min, sb_max, k_max, inds)

    tol = 1e-7;
    k = k_max;
    sg = (sb_max + sb_min) / 2;

    b = rand(size(D, 1), 1);
    [T, Q] = inv_Lanczoh(D, sg, b, k_max);

    %sb_min_T = 1/(sb_min - sg)*1.1;
    %sb_max_T = 1/(sb_max * 1.1- sg)*1.1;

    sb_min_T = -0.5;
    sb_max_T = 0.5;


    eig_T = bisection_eig_sym(T, sb_min_T, sb_max_T, tol);

    eig_D = 1 ./ eig_T + sg;


    % T - трёхжиагональная матрица размера k x k
    % Q - матрица отображения на k-мерное крыловское подстространство
    
    start_vec = ones(k, 1);
    eig_vector_T = zeros(k, length(eig_D));

    for i = 1:length(eig_D)
        eig_vector_T(:, i) = eigen_vector_searcher(T, eig_T(i), start_vec, tol);
    end

    eig_vector_D = Q*eig_vector_T;

    for i = 1:length(eig_D)
        eig_vector_D(:, i) = eigen_vector_searcher(D, eig_D(i), eig_vector_D(:, i), tol);
    end


    % normolize eigenvectors
    eig_vector_D = eig_vector_D ./ norm(eig_vector_D, 2);

    Q_norms = sum(Q .^ 2, 1);
    indexes = find(Q_norms > 0.5);
    indexes = intersect(indexes, inds);

    sB = eig_D(indexes);
    F = eig_vector_D(:, indexes);

end
