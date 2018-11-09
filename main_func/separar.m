function [U, c] = separar(Ab, colunas)
    [m, n] = size(Ab);
    U = Ab(:,1:colunas);
    if colunas == n
        c = NaN;
    else
        c = Ab(:,colunas+1:end);
    endif
end