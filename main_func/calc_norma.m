function norma = calc_norma(x, X)
	m = max(size(X));
	
	normaNum = 0;
	normaDen = 0;
	for i=1:m
		t = abs(x(i) - X(i));
		if ( t > normaNum )
			normaNum = t;
		endif
		if ( abs(x(i)) > normaDen )
			normaDen = abs(x(i));
		endif
		X(i) = x(i);
	endfor
	norma = normaNum/normaDen;

endfunction