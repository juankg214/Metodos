function main()
  rand ("state", 1);
  x = 2*rand (1000,1) - 1;
  y = 2*rand (size (x)) - 1;
  z = sin (2*(x.^2+y.^2));
  [xx,yy] = meshgrid (linspace (-1,1,32));
  zz = griddata (x, y, z, xx, yy);
  plot3(x,y,z,"*");
  axis tight; hold on
  mesh (xx, yy, zz);
endfunction
