function [A] = rem_row_col(A, i,j)
    A([i],:) = [];
    A(:,[j]) = [];
end