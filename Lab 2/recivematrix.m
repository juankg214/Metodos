function matrix = recivematrix(n)
  m =[]
  for i =1:n
       in=input(cstrcat("element on the row ",mat2str(i)," separated by spaces \n"),"s");
       m = vertcat(m,cellfun("str2num",strsplit(in," ")));
  endfor
  disp(m)
  matrix=m;
endfunction
