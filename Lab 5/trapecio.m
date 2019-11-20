function f=trapecio()

  fprintf('\t\tMétodo del trapecio\n');
  f=input('Ingrese la funcion f(x)=','s');
  b=input('Ingrese el limite superior de la integral:');
  a=input('Ingrese el limite inferior de la integral:');
  m=input('Ingrese el numero de intervalos:');
  
  h = (b-a)/m; g=inline(f);%inline allow us to input linear functions
  s=0 %storage base
  
  for i=1:m %it takes values since 1 until m-1 node (if there are 10 nodes it will be 1 to 9)
    
    %s=s+(h/2)*(g(a)+g(a+h));
    %a=a+h;
    s=h/2*(g(a+(i-1)*h)+g(a+(i)*h))+s;%trapeze formula
    
  endfor
    fprintf('El valor aproximado de la integral es: %10.15f\n\n',s);

endfunction
