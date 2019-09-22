function matrix = recivematrix(n,s)
  printf("Ingrese los datos de la Matriz %s :\n", s);
  m =[];
  for i =1:n
       in=input(cstrcat("Elementos en la fila ",mat2str(i)," separados por espacios:\n"),"s");
       m = vertcat(m,cellfun("str2num",strsplit(in," ")));
       if s != "a"
          break;
       endif
  endfor
  matrix = m;
endfunction