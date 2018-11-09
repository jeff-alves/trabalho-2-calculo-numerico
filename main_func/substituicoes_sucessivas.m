function c = substituicoes_sucessivas(L,b) # Aplicar na L
    [m,n] = size(L);
    x = zeros(n,1);
    c = zeros(m,1);
    x_atual = 1;

    for i=1:m
        pivo=0;
        for j=n:-1:x_atual
            if L(i,j) != 0
                pivo = j;
                break;
            endif
        endfor
        if ! pivo
            continue;
        endif

        for k = x_atual+1:pivo-1
            printf("Sem pivo para coluna %d. Vamos assumir que x%d = 0\n\n", k,k);
        endfor
        x_atual = pivo;
        
        soma = 0;
        for j=x_atual-1:-1:1
            soma += L(i,j) * x(j,1);
        endfor
        
        x(x_atual,1) = (b(i,1) - soma) / L(i,x_atual);
        c(i,1) = x(x_atual,1);
        x_atual += 1;
    endfor

endfunction