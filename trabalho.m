addpath ("extra_func:main_func")
format rat;
format compact;

p = parse_args(argv(), nargin);

if p.f1

  A1 = dlmread(p.f1);
  b1 = dlmread(p.f2);
  A2 = dlmread(p.f3);
  b2 = dlmread(p.f4);

  printf("\n\tMetodo de Gauss.\n\n");
  [L,U,P,trocas,c] = escalonar(A1, b1, true, false);
  detA = determinante(U, upper=true, trocas=trocas);
  printf("Matriz U =\n"); disp(U), disp('');
  printf("Vetor c =\n"); disp(c), disp('');
  check_inconsistente(U, c, detA);
  x1 = resolucao_gauss(U, c);
  ponto_fraco = mean(x1);
  
  printf("\n\tMetodo de Jacob.\n\n");
  printf("Matriz A2 =\n"); disp(A2), disp('');
  #valido = checar_criterio_linhas(A2);
  #if !valido
    #printf("Criterio de linhas não satisfeito. Executando pivotamento de linhas:\n");
    #[A2,b2] = pivotar(A2, b2);
    #A2
    valido = checar_criterio_linhas(A2);
    if !valido
      printf("Criterio de linhas não satisfeito. Continuando execução, sem garantia de convergencia.\n\n");
    else
      printf("Criterio de linhas satisfeito! Continuando execução.\n\n");
    endif
  #else
    #printf("Criterio de linhas satisfeito! Continuando execução.\n\n");
  #endif
  [x2, it] = jacob(A2, b2, p.e, p.max_it);


  #fazer interpolação de Newton aqui!
  polinomio = polyfit (x1, x2, 4); #interpolação quadratica (fazer usando metodo de newton)
  pressao = polyval (polinomio, ponto_fraco); #calcular o polinomio obtido para o ponto fraco

  
  
  # Mostrar informações pedidas no trabalho...
  [~,idx] = sort([x1,x2](:,1));
  pontos = [x1,x2](idx,:);
  printf("Pontos amostrais ordenados com suas respectivas pressões:\n"); disp(pontos),disp('');
  printf("Ponto mais fraco: %d\n",ponto_fraco);
  printf("Pressão neste ponto: %d\n\n",pressao);

  
  # Plotar!
  x = linspace (min(x1), max(x1), 101);
  y = polyval (polinomio, x);
  plot (x, y, x1, x2, 's');
  legend ('Polinomio gerado', 'Dados originais');
  input('Pressione Enter para continuar');
  
else
  print_help();
  exit(1);
endif