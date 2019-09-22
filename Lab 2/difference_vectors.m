function c = difference_vectors(x,y)
  n = size(x)(2);
  c = true;
  epsilon = 0.00001;
  for i = 1:n
    if abs(x(i)-y(i)) > epsilon
      c = false;
      break
    endif
  endfor
endfunction

