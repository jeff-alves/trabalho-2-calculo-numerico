function valido = checar_criterio_linhas(A)
	[m, n] = size(A);

	valido = true;
	D = diag(diag(A));
	B = A-D;
	for i = 1:m
		d = abs(D(i,i));
		sum_linha = sum(abs(B(i,1:n)));
		if d <= sum_linha
			printf('%d > soma( %s) ? Não satisfaz.\n', d, sprintf('%d ', abs(B(i,1:n))))
			valido = false;
			# break
		else
			printf('%d > soma( %s) ? OK\n', d, sprintf('%d ', abs(B(i,1:n))))
		endif
	endfor
endfunction