%given the vector A, its skew symmetric matrix AX is returned

   function AX = X2vec(A)
   AX = [0 -A(3,1) A(2,1); A(3,1) 0 -A(1,1); -A(2,1) A(1,1) 0];
