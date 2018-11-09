function valido = checar_criterio_linhas(A)
	[m, n] = size(A);

	valido = true;
	for i = 1:m
		Di = abs(A(i,i));
		sum_linha = sum(abs(A(i,1:n)))-Di;
		if Di/sum_linha <= 1
			valido = false;
			break
		endif
	endfor
endfunction