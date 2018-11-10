function [x, it] = jacob(A, b, E, max_it)
	[m, n] = size(A);
	
	for i=1:m #calcular chute inicial.
		X(i) = b(i)/A(i,i);
	endfor

	norma = Inf;
	it = 0;
	while (norma > E && it < max_it)
		it = it + 1;
		for i=1:m
			P = A(i,i);
			if (P == 0)
				printf("Divisão por zero na linha(%d). Faça o pivotamento para garantir que o elemento da diagonal não seja zero!\n\n", i);
				exit(1)
			endif
			soma = 0;
			for j=1:m
				if(j~=i)
					soma = soma + A(i,j) * X(j) / P;
				endif
			endfor
			x(i) = (b(i) / P) - soma;
		endfor
		#norma = abs(norm(x) - norm(X));
		norma = calc_norma(X, x);
		X=x;
	endwhile
	x = x';

	if norma <= E
		printf("Convergiu! Norma (%d), It (%d). Vetor de icognitas x =\n", norma, it); disp(x), disp('');
	elseif it == max_it
		printf("Limite de iterações atingido. Norma (%d), Parando na iteraçao (%d) com x =\n", norma, it); disp(x), disp('');
	endif

endfunction