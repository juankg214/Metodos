function s = sumation(fun,index,index2,vec)
  sum = 0;
  f = inline(fun,"x","y");
  for i = 1:size(vec)(2)
    sum = sum +f(vec(i,index),vec(i,index2));
  endfor
  s = sum
endfunction
