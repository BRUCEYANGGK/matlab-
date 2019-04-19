%早晚一炷香，优化不要慌
%晨昏三叩首，找个女朋友
%我是杨国康，一个劣质程序员:)

%%%%%%%%%%%%%%%%%%%--Haris角点检测--%%%%%%%%%%%%%%%%%

function MyHaris
%读取图像facade.bmp
im=imread('facade.bmp');
%将图像im灰度化
im=rgb2gray(im);
%将unit8类型矩阵转换为double型
im=im2double(im);
%y方向梯度模板
hy=[-1,-1,-1;0,0,0;1,1,1];
%x方向梯度模板
hx=hy';
%x方向滤波
Fx=filter2(hx,im);
%y方向滤波
Fy=filter2(hy,im);
%求平方
Fx2=Fx.^2;
Fy2=Fy.^2;
%两个方向梯度乘积
Fxy=Fx.*Fy;
%高斯去噪
w=fspecial('gaussian',[7,7],2);
Fx2=imfilter(Fx2,w,'replicate');
Fy2=imfilter(Fy2,w,'replicate');
Fxy=imfilter(Fxy,w,'replicate');
%取灰度化的im矩阵的大小
[m,n]=size(im);
%角点提取
for i=1:m
    for j=1:n
        %准则函数
        M=[Fx2(i,j) Fxy(i,j);Fxy(i,j) Fy2(i,j)];
        %trace是矩阵的迹
        R(i,j)=det(M)-0.06*trace(M).^2;
    end
end
%非极大值抑制，保留R(i,j)>0.01*Rmax与R(i,j)>3*3邻域内所有响应值
Rmax=max(max(R));
r=0.01*Rmax;
for i=1:m
    for j=1:n
        if R(i,j)<=r
            R(i,j)=0;
        end
    end
end
%获取角点
corner_peaks=imregionalmax(R);
[cnrx,cnry]=find(corner_peaks==1);
figure
%显示
imshow(im);
%图片显示保持
hold on
for i=1:length(cnrx)
    	plot(cnry(i),cnrx(i),'r.','Markersize',15);
end
end