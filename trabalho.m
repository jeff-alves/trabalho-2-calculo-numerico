addpath ("extra_func:main_func")
format rat;
format compact;

# Trabalho-1-asdf (Jefferson Alves)

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

  
  printf("\n\tMetodo de Jacob.\n\n");
  A2
  valido = checar_criterio_linhas(A2);
  if !valido
    printf("Criterio de linhas não satisfeito. Executando pivotamento de linhas:\n");
    [A2,b2] = pivotar(A2, b2);
    A2
    valido = checar_criterio_linhas(A2);
    if !valido
      printf("Criterio de linhas não satisfeito. Continuando execução, sem garantia de convergencia.\n\n");
    else
      printf("Criterio de linhas satisfeito! Continuando execução.\n\n");
    endif
  else
    printf("Criterio de linhas satisfeito! Continuando execução.\n\n");
  endif
  
  #[L,U,P,trocas,c] = escalonar(f3, f4, true, false);
  #detA = determinante(U, upper=true, trocas=trocas);
  #printf("Matriz U =\n"); disp(U), disp('');
  #printf("Vetor c =\n"); disp(c), disp('');
  #check_inconsistente(U, c, detA);
  #x2 = resolucao_jordan(U, c, p.steps);

  

else
  print_help();
  exit(1);
endif