function A = troca_linhas(A, l1, l2)
	A([l1 l2],:) = A([l2 l1],:);
endfunction