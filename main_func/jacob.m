function [x, it] = jacob(A, b, E, max_it)
	[m, n] = size(A); #linhas/colunas
	
	#TODO: Melhorar chute inicial... diag / b...
	X = zeros(m,1);

	#TODO: Corrigir erro div por zero em casos onde não converge...
	convergiu = false;
	it = 0;
	while (!convergiu && it <= max_it)
		it = it + 1;
		for i=1:m
			soma = 0;
			for j=1:m
				if(j~=i)
					soma = soma + A(i,j)*X(j)/A(i,i);
				end
			end
			x(i) = (b(i)/A(i,i)) - soma;
		end
		if (abs(norm(x) - norm(X))< E)
			convergiu = true;
			x = x';
		else
			X=x;
		end
	endwhile

	if convergiu
		printf("Vetor de icognitas x =\n"); disp(x), disp('');
	else
		printf("Não convergiu... Parando na iteraçao (%d) com x =\n", it); disp(x'), disp('');
	endif

endfunction