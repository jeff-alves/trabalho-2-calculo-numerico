function x = resolucao_gauss(U, c, detA)
    
    printf("\t##### Resolução por Gauss #####\n\n");

    x = substituicoes_retroativas(U, c);
    
	printf("Vetor de icognitas x =\n"); disp(x), disp('');

endfunction