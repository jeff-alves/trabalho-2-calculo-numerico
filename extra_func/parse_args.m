function params = parse_args (arg_list, arg_size)
    erro = false;
    q = 1;
    pass = false;
    if ! arg_size
      print_help()
      exit(1)
    endif;

    for i = 1:arg_size
      if pass
        pass = false;
        continue
      endif
      v = arg_list{i};
      if strcmp(substr(v, 1,1), '-')
        name = substr(v, 2);
        val = eval(arg_list{i+1}, 'arg_list{i+1}');
        pass = true;
      else
        name = strcat('v', num2str(q));
        val = eval(v, 'v');
        q += 1;
      endif
       params.(name) = val;
    endfor

    if !isfield(params, 'steps')
      params.('steps') = false;
    endif

    if erro
      print_help()
    endif

endfunction 