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
%��ȡ3d�ļ�'model.ply'
X=pcread('model.ply');
%��3dͼƬ��Ƴ�ȫ�ֱ���
handles.X=X;
axes(handles.axes1);
pcshow(X);
hold on;
t=[0,0,0];
R=eye(3,3);
cam=plotCamera('Location',t,'Orientation',R,'Size',50);
hold on;
%��ʼ��edit��
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
%��ͼ�ν����ȡFx��Fy��Cx��Cy��ֵ
Fx=str2double(get(handles.edit1,'String'));
Fy=str2double(get(handles.edit2,'String'));
Cx=str2double(get(handles.edit3,'String'));
Cy=str2double(get(handles.edit4,'String'));
%��ȡ3dͼ�����е����ά����
S=handles.X.Location;
%����ƶ�����
K=[Fx,0,Cx;0,Fy,Cy;0,0,1];
m=K*S';%��άӳ��
%���X,Y����
mx=round(m(1,:)./m(3,:));
my=round(m(2,:)./m(3,:));
%��ɫ��ȡ
color=handles.X.Color;
%ͨ������
image_B=zeros(100);
image_G=zeros(100);
image_R=zeros(100);
%Դͼ�����53215�����ص㣬ÿ�����ص�������ɫ�����Բ�����ķ������ǰ�������ɫ������һ��
%���Ǿ���ӳ���õ�53215�����꣬�������ظ����ꡣ���ǵ�X.Location��X.Color˳����һһ��Ӧ
%������ͼ����ɫʱ�ᱻ���ǣ����ǿ��Ժ��ԣ���Ϊӳ��õ�����ɫ�������ص���Χ����ɫ�����Բ��ù�
%����ͼ����RGB�����Ҷ�ͼ�ϳɣ������ڴ����ʱ��ҲҪ��Ϊ����������ÿ�������ӦX.Color��ͬ����
for i=1:53215
    num=(my(i)-1)*100+mx(i);
    image_R(num)=color(i);
    image_G(num)=color(i+53215);
    image_B(num)=color(i+53215*2);
end
%��ͼ��ǿ��ת��Ϊuint8���ͣ�����ͼƬ������ɫΪ��
image_R=uint8(image_R);
image_G=uint8(image_G);
image_B=uint8(image_B);
%ͨ���ϳ�
image=cat(3,image_R,image_G,image_B);
axes(handles.axes2);
imshow(image);
