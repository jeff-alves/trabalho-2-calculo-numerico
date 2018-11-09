function x = resolucao_lu(L, U, P, b, detA)
    
    printf("\t##### Resolução por LU #####\n\n");

    c = substituicoes_sucessivas(L, P*b);
    printf("Vetor c =\n"); disp(c), disp('');

    check_inconsistente(U, c, detA);

    x = substituicoes_retroativas(U, c);
    printf("Vetor de icognitas x =\n"); disp(x), disp('');

endfunction