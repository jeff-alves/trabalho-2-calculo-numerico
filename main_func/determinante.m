function [result] = determinante(A, upper=false, trocas=0)
    [m, n] = size(A);
	if m ~= n
		printf('Não é possivel calcular o determinante. Matriz não é uma matriz quadrada\n\n');
        result = NaN;
        return
	endif
    
    if (upper) # determinante pela Triangular superior
        result = A(1,1);
        for i = 2:m # multiplica todos os elementos da diag principal
            result *= A(i,i);
        endfor
        result = power(-1,trocas) * result; # inverte o sinal para cada troca de linhas
    
    else # determinante recursivo
        if(m == 1)
			result = A(1,1);
		else
			sinal = 1;
			result = 0;
            for i = 1:m
                result += sinal * A(1,i) * determinante(rem_row_col(A,1,i));
				sinal *= -1;
            endfor
    endif

end