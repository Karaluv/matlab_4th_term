matrix = randi(100, 110, 110);

main_diagonal_sum = sum(diag(matrix));

side_diagonal_sum = sum(diag(fliplr(matrix)));


index_y_norm = 1:110;
index_x_norm = 1:110;
index_y_rev = 1:110;
index_x_rev = flip(1:110);

matrix(index_x_norm, index_y_norm) = matrix(index_x_rev, index_y_rev);

determinant_matrix = zeros(11,11);
for i = 1:11
    for j = 1:11
        submatrix = matrix((i-1)*10+1:(i-1)*10+10, (j-1)*10+1:(j-1)*10+10);
        determinant_matrix(i,j) = det(submatrix);
    end
end

disp("Determinant matrix:");
disp(determinant_matrix);

original_determinant = det(matrix);
new_determinant = det(determinant_matrix);

fprintf("The determinant of the original matrix is: %f\n", original_determinant);
fprintf("The determinant of the new matrix is: %f\n", new_determinant);
if original_determinant == new_determinant
    fprintf("The determinants are equal.\n");
else
    fprintf("The determinants are not equal.\n");
end