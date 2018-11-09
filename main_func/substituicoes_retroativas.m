function x = substituicoes_retroativas(U, b) #Aplicar na U
    [m,n] = size(U);
    
    x = zeros(n,1);
    x_atual = n;
    
    for i=m:-1:1
        pivo = 0;
        for j=1:x_atual
            if U(i,j) != 0
                pivo = j;
                break;
            endif
        endfor
        if ! pivo
            continue;
        endif

        for k = x_atual:-1:pivo+1
            printf("Sem pivo para coluna %d. Vamos assumir que x%d = 0\n\n", k,k);
        endfor
        x_atual = pivo;
        
        soma = 0;
        for j=x_atual+1:n
            soma += U(i,j) * x(j,1);
        endfor

        x(x_atual,1) = (b(i,1) - soma) / U(i,x_atual);
        x_atual -= 1;
    endfor
endfunction