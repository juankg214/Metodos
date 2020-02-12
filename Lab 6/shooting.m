<<<<<<< HEAD
function x = shooting(p,q,r,alpha,beta,a,b,h)
  t = a;
  m = (b-a)/h;
  all = strcat(p,"+",q,"+",r);  
  uf = inline(all,"t");
  disp(uf)
  all = strcat(p,"+",q);
  vf = inline(all,"t");
  u=1
  for j=0:m
    u = rk4(uf,t,u,h);
    t=t+h
    disp(u);
  endfor
endfunction
=======
function x= shooting(p,q,r,alpha,beta,a,b,h)
  #exact solution
  pvi = "1.25+0.486089652*t-2.25*t^2+2*t*atan(t)+1/2*(t^2-1)*log(1+t^2)";
  #define the function 
  pvi = inline(pvi,"t");
  #apply runga kutta to the funtion u
  u1= rk_shooting(p,q,r,alpha,0,h,a,b);
  #apply runga kutta to the funtion v
  v1 = rk_shooting(p,q,r,0,1,h,a,b);
  #number of intervals
  m = (b-a)/h;
  #vectors for the answer
  w=[];
  pv=[];
  w2 =[];
  k=[];
  tvec = [];
  error =[];
  t =h;
  #contatan to calculate w
  const = ((beta - u1(m))/v1(m));
  for i=1:m
    #add to the t vector
    tvec(i) = t;
    #the correct answer to the vector
    pv(i) = pvi(t);
    #calculate w
    w(i) = u1(i) + const*v1(i);
    #do the step
    t=t+h;
  endfor
  #print the answer
  disp("        K                      w               pv                  Error");
  disp(horzcat([1:m]',w',pv',abs(pv'-w')))
  #create the funtion to the graph
  y = arrayfun(pvi,tvec); # we apply the function ff to every value in x, and we get the y-axis 
  plot(tvec,w,"-b",tvec,y,"-r");#We plot the x,y
  hold on;#We are going to add more things to the plot
  grid on;#We add a grid
  #info of the graphic
  title("Metodo del disparo lineal"); #title
  legend("Funci�n Aproximada","Funci�n Exacta"); #legends
  #labels
  ylabel("eje y"); 
  xlabel("eje x");
endfunction
#shooting("2*t/(1+t^2)","-2/(1+t^2)","1",1.25,-0.95,0,4,0.2) ejercicio
#shooting("-2/t","2/t^2","sin(log(t))/t^2",1,2,1,2,0.1) la que vimos en el pdf
>>>>>>> 3e3f76d5e2c1fb1f742d5ba522185ee685c78d0f
