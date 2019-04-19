function gaussianFilter
im=imread('scene1.jpg');
im=im2double(im);
R=im(:,:,1);
G=im(:,:,2);
B=im(:,:,3);
sigma_d=2;
s=5;
Rfiltered=gf(R,sigma_d,s);
Gfiltered=gf(G,sigma_d,s);
Bfiltered=gf(B,sigma_d,s);
result=cat(3,Rfiltered,Gfiltered,Bfiltered);
figure;
imshow(result);
end

function filteredImage=gf(grayImag,sigma,s)
[x,y]=meshgrid(1:s,1:s);
x=x-ceil(s/2);
y=y-ceil(s/2);
distence=x.^2+y.^2;
filter=exp(-distence/(2*sigma*sigma));
filter=filter/sum(sum(filter));
filteredImage=imfilter(grayImag,filter);
end

