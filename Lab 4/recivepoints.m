function p = recivepoints()
  #imprime el mensaje con el nombre de la matriz
  n = int32(input("Ingrese el numero de puntos \n"))  
  printf("Ingrese los puntos:\n");
  #inicializa la matriz
  m =[];
  #recorre las filas
  for i =1:n
       #imprime el mensaje del numero de la fila
       in=input(cstrcat("Elementos de la coordenada (x,y) ",mat2str(i)," separados por espacios:\n"),"s");
       #recibe la fila y la separa por espacios y la concatena con la matriz 
       m = vertcat(m,cellfun("str2num",strsplit(in," ")));
  endfor
  #retorna la matriz ingresada
  p = m;
endfunction