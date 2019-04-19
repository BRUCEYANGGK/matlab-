function varargout = myVirtualCam(varargin)
% MYVIRTUALCAM MATLAB code for myVirtualCam.fig
%      MYVIRTUALCAM, by itself, creates a new MYVIRTUALCAM or raises the existing
%      singleton*.
%
%      H = MYVIRTUALCAM returns the handle to a new MYVIRTUALCAM or the handle to
%      the existing singleton*.
%
%      MYVIRTUALCAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYVIRTUALCAM.M with the given input arguments.
%
%      MYVIRTUALCAM('Property','Value',...) creates a new MYVIRTUALCAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myVirtualCam_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myVirtualCam_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myVirtualCam

% Last Modified by GUIDE v2.5 19-Apr-2019 21:25:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myVirtualCam_OpeningFcn, ...
                   'gui_OutputFcn',  @myVirtualCam_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before myVirtualCam is made visible.
function myVirtualCam_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myVirtualCam (see VARARGIN)
%读取3d文件'model.ply'
X=pcread('model.ply');
%将3d图片设计成全局变量
handles.X=X;
axes(handles.axes1);
pcshow(X);
hold on;
t=[0,0,0];
R=eye(3,3);
cam=plotCamera('Location',t,'Orientation',R,'Size',50);
hold on;
%初始化edit栏
set(handles.edit1,'String',num2str(100));
set(handles.edit2,'String',num2str(100));
set(handles.edit3,'String',num2str(50));
set(handles.edit4,'String',num2str(50));
% Choose default command line output for myVirtualCam
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myVirtualCam wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myVirtualCam_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%从图形界面获取Fx、Fy、Cx、Cy的值
Fx=str2double(get(handles.edit1,'String'));
Fy=str2double(get(handles.edit2,'String'));
Cx=str2double(get(handles.edit3,'String'));
Cy=str2double(get(handles.edit4,'String'));
%获取3d图像所有点的三维坐标
S=handles.X.Location;
%相机移动矩阵
K=[Fx,0,Cx;0,Fy,Cy;0,0,1];
m=K*S';%降维映射
%获得X,Y坐标
mx=round(m(1,:)./m(3,:));
my=round(m(2,:)./m(3,:));
%颜色获取
color=handles.X.Color;
%通道分离
image_B=zeros(100);
image_G=zeros(100);
image_R=zeros(100);
%源图像存在53215个像素点，每个像素点三种颜色，所以采用最笨的方法就是把所有颜色都遍历一遍
%我们经过映射后得到53215个坐标，其中有重复坐标。考虑到X.Location与X.Color顺序上一一对应
%所以在图像着色时会被覆盖，但是可以忽略，因为映射得到的颜色都是像素点周围的颜色，可以不用管
%由于图像由RGB三个灰度图合成，所以在处理的时候也要分为三个矩阵处理，每个矩阵对应X.Color不同的列
for i=1:53215
    num=(my(i)-1)*100+mx(i);
    image_R(num)=color(i);
    image_G(num)=color(i+53215);
    image_B(num)=color(i+53215*2);
end
%对图像强制转化为uint8类型，这样图片不会着色为白
image_R=uint8(image_R);
image_G=uint8(image_G);
image_B=uint8(image_B);
%通道合成
image=cat(3,image_R,image_G,image_B);
axes(handles.axes2);
imshow(image);
