function Ab = aumentada(A, b)
	if isnan(b)
		Ab = A;
	else
		Ab = [A b];
	endif;
endfunction