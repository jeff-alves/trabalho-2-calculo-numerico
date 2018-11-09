function [A,b] = pivotar(A, b)
	[m, n] = size(A);

	Ab = aumentada(A, b);
	linha_pivo_atual = 1;
	for j = 1:n
		if Ab(j:end,j) == zeros(m-j+1,1)
			continue
		endif

		[maior indice] = max(abs(Ab(j:end,j)));
		indice=indice+j-1;
		if j ~= indice
			Ab = troca_linhas(Ab, j, indice);
		endif
		if Ab(linha_pivo_atual,j) == 0
			continue
		endif
		linha_pivo_atual+=1;
	endfor
	[A, b] = separar(Ab, n);
endfunction