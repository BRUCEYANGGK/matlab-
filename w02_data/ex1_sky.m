im = imread('scene1.jpg'); % ��ȡͼ��
[rows, cols, nc] = size(im); 
% ͨ������
R = im(:,:,1); 
G = im(:,:,2); 
B = im(:,:,3); 
flg = R >= 100 & G >= 100 & B >= 200; 
R(flg) = 255; 
G(flg) = 127; 
B(flg) = 0; 
im_ = cat(3, R,G,B); 
imshow(im_)
imwrite(im_,'sky1.jpg')