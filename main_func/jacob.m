function [A, b] = jacob(A, b)
	[m, n] = size(A);

	Ab = aumentada(A, b);
	if steps printf("Matriz Inicial =\n"); disp(Ab), disp(''); endif

	L = zeros(m,n);
	P = eye(m);
	trocas = 0;
	linha_pivo_atual = 1;

	k = 1;
	max_it = 50;
	while (k <= max_it)
	endwhile

	...

	[U, c] = separar(Ab, n);
endfunction