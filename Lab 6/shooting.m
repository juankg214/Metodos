function x= shooting(p,q,r,alpha,beta,a,b,h)
  #exact solution
  pvi = "1.25+0.486089652*t-2.25*t^2+2*t*atan(t)+1/2*(t^2-1)*log(1+t^2)";
  #define the function 
  pvi = inline(pvi,"t");
  #apply runga kutta to the funtion u
  u1= rk_shooting(p,q,r,1,0,h,a,b);
  # define u fucntion
  uf = inline(strcat(p,"+",q,"+",r),"t");
  #apply runga kutta to the funtion v
  v1 = rk_shooting(p,q,"0",0,1,h,a,b);
  # define v fucntion
  vf = inline(strcat(p,"+",q),"t");
  #number of intervals
  m = (b-a)/h;
  #vectors for the answer
  w=[];
  pv=[];
  w2 =[];
  k=[];
  tvec = [];
  t =a;
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
  disp("        K          u          v          w            pv         Error");
  disp(horzcat([1:m]',u1',v1',w',pv',abs(pv'-w')))
  #create the funtion to the graph
  y = arrayfun(pvi,tvec); # we apply the function ff to every value in x, and we get the y-axis 
  plot(tvec,w,"-b",tvec,y,"-r");#We plot the x,y
  hold on;#We are going to add more things to the plot
  grid on;#We add a grid
  #info of the graphic
  title("Metodo del disparo lineal"); #title
  legend("Función Aproximada","Función Exacta"); #legends
  #labels
  ylabel("eje y"); 
  xlabel("eje x");
 
endfunction
#shooting("2*t/(1+t^2)","-2/(1+t^2)","1",1.25,-0.95,0,4,0.2) ejercicio
#shooting("-2/t","2/t^2","sin(log(t))/t^2",1,2,1,2,0.1) la que vimos en el pdf