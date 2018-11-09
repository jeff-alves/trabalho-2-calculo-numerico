function [L,U,P,trocas,c] = escalonar(A, b=NaN, pivotar=false, steps=true)
	[m, n] = size(A);

	Ab = aumentada(A, b);
	if steps printf("Matriz Inicial =\n"); disp(Ab), disp(''); endif

	L = zeros(m,n);
	P = eye(m);
	trocas = 0;
	linha_pivo_atual = 1;

	for j = 1:n
		if steps printf("\t##### COLUNA ATUAL: %d #####\n\n",j); endif;
		if Ab(j:end,j) == zeros(m-j+1,1)
			if steps printf("Coluna %d só de zeros, indo para próxima.\n\n", j); endif;
			continue
		endif

		if pivotar
			[maior indice] = max(abs(Ab(j:end,j)));
			indice=indice+j-1;
			if j ~= indice
				Ab = troca_linhas(Ab, j, indice);
				P = troca_linhas(P, j, indice);
				L = troca_linhas(L, j, indice);
				trocas += 1;
				if steps printf("Troca L%d <=> L%d =\n", j, indice); disp(Ab), disp(''); endif;
			endif
			if Ab(linha_pivo_atual,j) == 0
				if steps printf("Nenhum Pivo encontrado na coluna %d, indo para próxima.\n\n", j); endif;
				continue
			endif
		endif

		if steps printf("Pivo(%d,%d): %d\n\n", linha_pivo_atual, j, Ab(linha_pivo_atual,j)); endif;
		L(linha_pivo_atual,j)=1;

		for i = linha_pivo_atual+1:m
			if Ab(linha_pivo_atual,j) == 0
				error('Divisão por zero! Tente resolver com pivotamento\n');
			endif
			if Ab(i,j) == 0
				if steps printf("Elemento para zerar: Ab(%d,%d) = %d, já é zero, indo para próximo\n\n",i, j, Ab(i,j)); endif;
				continue;
			endif
			if steps printf("Elemento para zerar: Ab(%d,%d) = %d\n\n", i, j, Ab(i,j)); endif;
			p = Ab(i,j) / Ab(linha_pivo_atual,j);
			Ab(i,:) -= p * Ab(linha_pivo_atual,:);
			L(i,j) = p;
			if steps printf("L%d = L%d - (%d * L%d) =\n", i,i,p,linha_pivo_atual); disp(Ab), disp(''); endif;
		endfor
		linha_pivo_atual+=1;
	endfor

	[U, c] = separar(Ab, n);
endfunction