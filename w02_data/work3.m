    [I,map1]=imread('bottle.jpg');
   [J,map2]=imread('sky.jpg');
   K=imadd(I,J);
   imshow(J);
   imshow(I);
   imshow(K);