function varargout = MatlabUI(varargin)
% MATLABUI MATLAB code for MatlabUI.fig
%      MATLABUI, by itself, creates a new MATLABUI or raises the existing
%      singleton*.
%
%      H = MATLABUI returns the handle to a new MATLABUI or the handle to
%      the existing singleton*.
%
%      MATLABUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLABUI.M with the given input arguments.
%
%      MATLABUI('Property','Value',...) creates a new MATLABUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MatlabUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MatlabUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MatlabUI

% Last Modified by GUIDE v2.5 09-Apr-2019 20:02:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MatlabUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MatlabUI_OutputFcn, ...
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


% --- Executes just before MatlabUI is made visible.
function MatlabUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MatlabUI (see VARARGIN)
im=imread('inputImg.bmp');
axes(handles.InputImage);
imshow(im);
handles.im=im;
set(handles.edit1,'String',num2str(5));
set(handles.edit2,'String',num2str(2));
set(handles.edit3,'String',num2str(2));
set(handles.edit4,'String',num2str(1));
set(handles.edit5,'String',num2str(7));
set(handles.edit6,'String',num2str(2));
set(handles.edit7,'String',num2str(0.0001));
% Choose default command line output for MatlabUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MatlabUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MatlabUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function image_open_Callback(hObject, eventdata, handles)
% hObject    handle to image_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile('*.jpg;*.bmp;*.png','选择图像');
imgName=fullfile(pathname,filename);
handles.im=imread(imgName);
axes(handles.InputImage);
imshow(handles.im);
guidata(hObject, handles);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents=cellstr(get(handles.popupmenu1,'String'));
action=contents{get(handles.popupmenu1,'Value')};
switch action
    case '请选择一个功能'
        msgbox('请选择一个功能！');
    case '图像增强Laplacian'
        h2=fspecial('laplacian',0);
        laplacianImg=imfilter(handles.im,h2);
        sharpenedImg=handles.im-laplacianImg;
        axes(handles.OutputImage);
        imshow(sharpenedImg);
        guidata(hObject, handles);
        set(handles.edit1, 'enable', 'off'); 
        set(handles.edit2, 'enable', 'off'); 
        set(handles.edit3, 'enable', 'off'); 
        set(handles.edit4, 'enable', 'off'); 
        set(handles.edit5, 'enable', 'off'); 
        set(handles.edit6, 'enable', 'off'); 
        set(handles.edit7, 'enable', 'off'); 
    case '图像去噪NLM'
        search_wsize=str2double(get(handles.edit1,'String'));
        simi_wsize=str2double(get(handles.edit2,'String'));
        sigma=str2double(get(handles.edit3,'String'));
        dist_sigma=str2double(get(handles.edit4,'String'));
        tic;
        handles.im=im2double(handles.im);
        result_Image=nlm(handles.im,search_wsize,simi_wsize,sigma);
        toc;
        axes(handles.OutputImage);
        imshow(result_Image);
         set(handles.edit1, 'enable', 'on'); 
        set(handles.edit2, 'enable', 'on'); 
        set(handles.edit3, 'enable', 'on'); 
        set(handles.edit4, 'enable', 'on'); 
        set(handles.edit5, 'enable', 'off'); 
        set(handles.edit6, 'enable', 'off'); 
        set(handles.edit7, 'enable', 'off'); 
    case '图像复原Wiener'
        set(handles.edit1, 'enable', 'off'); 
        set(handles.edit2, 'enable', 'off'); 
        set(handles.edit3, 'enable', 'off'); 
        set(handles.edit4, 'enable', 'off'); 
        set(handles.edit5, 'enable', 'on'); 
        set(handles.edit6, 'enable', 'on'); 
        set(handles.edit7, 'enable', 'on'); 
        LEN = str2double(get(handles.edit5,'String'));
        THETA = str2double(get(handles.edit6,'String'));
        noise_var = str2double(get(handles.edit7,'String'));
        handles.im=im2double(handles.im);
        PSF = fspecial('motion', LEN, THETA);
        signal_var = var(handles.im(:));
        
       % blurred = imfilter(handles.im, PSF, 'conv', 'circular');
        wnr3 = deconvwnr(handles.im, PSF, noise_var / signal_var);
        axes(handles.OutputImage);
        imshow(wnr3);
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
