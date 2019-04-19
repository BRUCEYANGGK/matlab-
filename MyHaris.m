%����һ���㣬�Ż���Ҫ��
%������ߵ�ף��Ҹ�Ů����
%�����������һ�����ʳ���Ա:)

%%%%%%%%%%%%%%%%%%%--Haris�ǵ���--%%%%%%%%%%%%%%%%%

function MyHaris
%��ȡͼ��facade.bmp
im=imread('facade.bmp');
%��ͼ��im�ҶȻ�
im=rgb2gray(im);
%��unit8���;���ת��Ϊdouble��
im=im2double(im);
%y�����ݶ�ģ��
hy=[-1,-1,-1;0,0,0;1,1,1];
%x�����ݶ�ģ��
hx=hy';
%x�����˲�
Fx=filter2(hx,im);
%y�����˲�
Fy=filter2(hy,im);
%��ƽ��
Fx2=Fx.^2;
Fy2=Fy.^2;
%���������ݶȳ˻�
Fxy=Fx.*Fy;
%��˹ȥ��
w=fspecial('gaussian',[7,7],2);
Fx2=imfilter(Fx2,w,'replicate');
Fy2=imfilter(Fy2,w,'replicate');
Fxy=imfilter(Fxy,w,'replicate');
%ȡ�ҶȻ���im����Ĵ�С
[m,n]=size(im);
%�ǵ���ȡ
for i=1:m
    for j=1:n
        %׼����
        M=[Fx2(i,j) Fxy(i,j);Fxy(i,j) Fy2(i,j)];
        %trace�Ǿ���ļ�
        R(i,j)=det(M)-0.06*trace(M).^2;
    end
end
%�Ǽ���ֵ���ƣ�����R(i,j)>0.01*Rmax��R(i,j)>3*3������������Ӧֵ
Rmax=max(max(R));
r=0.01*Rmax;
for i=1:m
    for j=1:n
        if R(i,j)<=r
            R(i,j)=0;
        end
    end
end
%��ȡ�ǵ�
corner_peaks=imregionalmax(R);
[cnrx,cnry]=find(corner_peaks==1);
figure
%��ʾ
imshow(im);
%ͼƬ��ʾ����
hold on
for i=1:length(cnrx)
    	plot(cnry(i),cnrx(i),'r.','Markersize',15);
end
end