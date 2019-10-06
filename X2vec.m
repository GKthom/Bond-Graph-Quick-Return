%given the skew symmetric mmatrix AX, the vector(AX) is returned

   function A = X2vec(AX)
   A = [-AX(2,3); AX(1,3); -AX(1,2)];
