function x = resolucao_jordan(U, c, steps=true)
    
    printf("\n\t##### Resolução por Jordan #####\n\n");

    [m, n] = size(U);
    Ab = aumentada(U, c);

    if steps printf("\nMatriz aumentada Uc =\n"); disp(Ab), disp(''); endif

    x = zeros(n,1);
    x_atual = n;
    for i=m:-1:1
        pivo = 0;
        for j=1:x_atual
            if Ab(i,j) != 0
                pivo = j;
                break;
            endif
        endfor
        if ! pivo
            continue;
        endif

        for k = x_atual:-1:pivo+1
            if steps printf("Sem pivo para coluna %d. Vamos assumir que x%d = 0\n\n", k,k); endif
        endfor
        x_atual = pivo;
        
        if Ab(i,x_atual) != 1
            piv = Ab(i,x_atual);
            Ab(i,:) /= piv;
            if steps printf("\nL%d = L%d / %d =\n", j, j, piv); disp(Ab), disp(''); endif
        endif

        for k = i-1:-1:1
            p = Ab(k,x_atual) / Ab(i,x_atual);
            Ab(k,:) -= p * Ab(i,:);
            if steps printf("\nL%d = L%d - (%d * L%d) =\n", k,k,p,i); disp(Ab), disp(''); endif
        endfor

        x_atual -= 1;
    endfor

    [J, x] = separar(Ab, n);
    printf("\nVetor de icognitas x =\n"); disp(x), disp('');
endfunction