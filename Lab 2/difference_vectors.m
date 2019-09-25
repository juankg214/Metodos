#funcion para evaluar la similitud entre dos vectores 
function c = difference_vectors(x,y)
  #recibimos los vectores x y y a calcular la diferencia
  n = size(x)(2);
  #creamos un vector de tamaño x para recorrer
  c = true;
  #inicializamos la varible boleana en true 
  epsilon = 10^-8;
  #elegimos un epsilon de diferencia optimo
  for i = 1:n
    #recorremos los vectores y comparamos su diferencia con el epsilon
    if abs(x(i)-y(i)) > epsilon
      #si no son lo suficientemente cercanos retornamos false
      c = false;
      break
    endif
  endfor
endfunction