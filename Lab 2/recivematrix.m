#funcion para recibir los datos de la matriz a evaluar
function matrix = recivematrix(n,s)
  #imprime el mensaje con el nombre de la matriz
  printf("Ingrese los datos de la Matriz %s :\n", s);
  #inicializa la matriz
  m =[];
  #recorre las filas
  for i =1:n
       #imprime el mensaje del numero de la fila
       in=input(cstrcat("Elementos en la fila ",mat2str(i)," separados por espacios:\n"),"s");
       #recibe la fila y la separa por espacios y la concatena con la matriz 
       m = vertcat(m,cellfun("str2num",strsplit(in," ")));
       if s != "a"
          break;
       endif
  endfor
  #retorna la matriz ingresada
  matrix = m;
endfunction