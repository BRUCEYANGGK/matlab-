function myGaussianPyramid
im=imread('lena.bmp');
im=im2double(im);
ima=im;
nlayers=3;
hsize=21;
sigma=logspace(-1,2,50);
factor=1;
[m,n,z]=size(im);
for j=1:nlayers
    for i=1:50
        h=fspecial('gaussian',hsize,sigma(i));
        image=imfilter(im,h,'replicate');
        imshow(image);
    end
    factor=factor/2;
    im=imresize(im,factor);
    R=im(:,:,1);
    G=im(:,:,2);
    B=im(:,:,3);
    A=padarray(R,[m*(1-factor),n*(1-factor)],'post');
    C=padarray(G,[m*(1-factor),n*(1-factor)],'post');
    D=padarray(B,[m*(1-factor),n*(1-factor)],'post');
    Red=ima(:,:,1);
    Green=ima(:,:,2);
    Blue=ima(:,:,3);
    Red(1:m*factor,1:n*factor)=zeros(m*factor,n*factor);
    Green(1:m*factor,1:n*factor)=zeros(m*factor,n*factor);
    Blue(1:m*factor,1:n*factor)=zeros(m*factor,n*factor);
    A=A+Red;
    C=C+Green;
    D=D+Blue;
    im=cat(3,A,C,D);
end
end