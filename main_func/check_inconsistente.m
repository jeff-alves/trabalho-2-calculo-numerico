function [] = check_inconsistente(U, c, detA)
    [m, n] = size(U);
	
	for i = 1:m
		if U(i,:) == zeros(1,n) && c(i,1) != 0
			printf("O sistema é impossível (não tem solução)\n\n");
			exit(1)
		endif
	endfor
	
	if isnan(detA) || detA == 0
		printf("O sistema é possível e indeterminado (infinitas soluções)\n\n");
	else
		printf("O sistema é possível e determinado (solução única)\n\n");
	endif
endfunction