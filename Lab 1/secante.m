fprintf('\nMétodo de la Secante\n');
%Se piden valores
fun = input('ingrese la funcion f(x) = ','s');
f = inline ( fun,'x'); #Se crea la función
p0 = input('Ingrese la aproximación inicial p0: '); #Aprox inicial
p1 = input('Ingrese la aproximación final p1: ');#Aprox final
itemax = input('Ingrese el numero de iteraciones máxima: '); #Iteracciones maximas
fprintf('\n Interacciones \tp0     \t\tp1     \t\tp        \tf(p)\n');
fprintf('\t%d \t%6.6f \t%6.6f \n',1,p0,p1);

%Datos

i=2;
q0 = f(p0);#Guardamos la funcion evaluada en p0 (f(p0)) en q0
q1 = f(p1);#Guardamos la funcion evaluada en p1 (f(p1)) en q1
while(i<=itemax)#Mientras que el número de iteracciones sea menor al número de iteracciones maximas:
%Interseccion en el eje X; Y = 0
p=p1-q1*(p1-p0)/(q1-q0);#Aplicamos la ecuacion predefinida para la fórmula de la secante con las distinta variables ya creadas (p0,p1,q0,q1)
fprintf('\t%d \t%6.6f \t%6.6f \t%6.6f \t%6.5f\n',i,p0,p1,p,f(p));#Creacion de lista
i++;
p0=p1;
q0=q1;
p1=p;
q1=f(p);
endwhile
fprintf('\n');

%Graficar
up = p0-5; 
down= p1+5;
x = up:0.01:down; # Se crea un vector desde el limite inicial superior hasta el limite inicial inferior en pasos de 0.01
z = arrayfun(f,x); # Se le aplica la funcion f(x) a cada valor del vector
plot(x,z); #Se grafican los valores
hold on; #Se va a agregar algo mas al plot
plot(p,0,"+g"); #Se grafica el punto (p,0) de color verde.
