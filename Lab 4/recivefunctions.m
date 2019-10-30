function p = recivefunctions
  #imprime el mensaje con el nombre de la matriz
  #imprime el mensaje del numero de la fila
  in=input("ingresa las funciones separadas por espacios \n","s");
  #recibe la fila y la separa por espacios y la concatena con la matriz 
  l = strsplit(in);
  #retorna la matriz ingresada
  p = l;
endfunction
