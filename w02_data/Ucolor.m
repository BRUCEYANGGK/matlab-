function colorFilter
im=imread('scene1.jpg');
im=im2double(im);
sigma_r=2;
s=5;
R=im(:,:,1);
G=im(:,:,2);
B=im(:,:,3);
Rfiltered=cf(R,sigma_r,s);
Gfiltered=cf(G,sigma_r,s);
Bfiltered=cf(B,sigma_r,s);
filteredImg=cat(3,Rfiltered,Gfiltered,Bfiltered);
filteredmg=cf(im,sigma_r,s);
imshow(filteredmg);
end

function filteredImg=cf(im,sigma,s)
[rows, cols, nc] = size(im); 
padsize=(s-1)/2;
padImg=padarray(im,[padsize,padsize],'replicate','both');
[x,y]=meshgrid(1:s,1:s);
X=ceil(s/2);
Y=ceil(s/2);
centerImg=im(X,Y);
distence=(centerImg-im(x,y)).^2;
color_filter=exp(-distence/(2*sigma*sigma));
color_filter=color_filter/sum(sum(color_filter));
filteredImg=imfilter(padImg,color_filter);
end
