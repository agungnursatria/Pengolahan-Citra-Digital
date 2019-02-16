function varargout = browseimage(varargin)
% BROWSEIMAGE MATLAB code for browseimage.fig
%      BROWSEIMAGE, by itself, creates a new BROWSEIMAGE or raises the existing
%      singleton*.
%
%      H = BROWSEIMAGE returns the handle to a new BROWSEIMAGE or the handle to
%      the existing singleton*.
%
%      BROWSEIMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BROWSEIMAGE.M with the given input arguments.
%
%      BROWSEIMAGE('Property','Value',...) creates a new BROWSEIMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before browseimage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to browseimage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help browseimage

% Last Modified by GUIDE v2.5 04-Dec-2018 23:12:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @browseimage_OpeningFcn, ...
                   'gui_OutputFcn',  @browseimage_OutputFcn, ...
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


% --- Executes just before browseimage is made visible.
function browseimage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to browseimage (see VARARGIN)

% Choose default command line output for browseimage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes browseimage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = browseimage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in browsebutton.
function browsebutton_Callback(hObject, eventdata, handles)
% hObject    handle to browsebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[a b] = uigetfile({'*.jpg';'*.png';'*.tif';'*.gif*'},'Image Selector');
img = imread([b a]);
assignin('base','img',img)
setGlobalImg(img);
setGlobalCheckGrayscale(0);
axes(handles.axes1);
imshow(img);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in greybutton.
function greybutton_Callback(hObject, eventdata, handles)
% hObject    handle to greybutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
isGrayscale = getGlobalCheckGrayscale;
if isGrayscale == 0
    img = getGlobalImg;
    if isempty(img) == 0
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);

        % Warna lebih condong ke biru
        abu2 = (((1/6)*R)+((1/6)*G)+((2/3)*B));
        assignin('base','abu2',abu2);
        
        setGlobalImg(abu2);
        setGlobalCheckGrayscale(1);
        axes(handles.axes1);
        imshow(abu2);
    end
end



% --- Executes on button press in zoominbutton.
function zoominbutton_Callback(hObject, eventdata, handles)
% hObject    handle to zoominbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    figure
    imshow(img);
    title('Before')
    img = zoomIn2x(img,isGrayscale);
    assignin('base','zoomIn2x',img);
    figure
    imshow(img);
    title('After')
end
    


% --- Executes on button press in zoomoutbutton.
function zoomoutbutton_Callback(hObject, eventdata, handles)
% hObject    handle to zoomoutbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    figure
    imshow(img);
    title('Before')
    img = zoomOut2x(img,isGrayscale);
    assignin('base','zoomOut2x',img);
    figure
    imshow(img);
    title('After')
end

function setGlobalImg(val)
global img
img = val;

function r = getGlobalImg
global img
r = img;

function setGlobalCheckGrayscale(val)
global isgray
isgray = val;

function r = getGlobalCheckGrayscale
global isgray
r = isgray;


% --- Executes on button press in geserKiri.
function geserKiri_Callback(hObject, eventdata, handles)
% hObject    handle to geserKiri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    img = geser(img,isGrayscale, 10, 'Kiri');
    axes(handles.axes1);
    imshow(img);
    setGlobalImg(img);
end


% --- Executes on button press in geserKanan.
function geserKanan_Callback(hObject, eventdata, handles)
% hObject    handle to geserKanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    img = geser(img,isGrayscale, 10, 'Kanan');
    axes(handles.axes1);
    imshow(img);
    setGlobalImg(img);
end


% --- Executes on button press in geserAtas.
function geserAtas_Callback(hObject, eventdata, handles)
% hObject    handle to geserAtas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    img = geser(img,isGrayscale, 10, 'Atas');
    axes(handles.axes1);
    imshow(img);
    setGlobalImg(img);
end


% --- Executes on button press in geserBawah.
function geserBawah_Callback(hObject, eventdata, handles)
% hObject    handle to geserBawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    img = geser(img,isGrayscale, 10, 'Bawah');
    axes(handles.axes1);
    imshow(img);
    setGlobalImg(img);
end


% --- Executes on button press in brighten.
function brighten_Callback(hObject, eventdata, handles)
% hObject    handle to brighten (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Darken.
function Darken_Callback(hObject, eventdata, handles)
% hObject    handle to Darken (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in plus10.
function plus10_Callback(hObject, eventdata, handles)
% hObject    handle to plus10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    img = brightness(img,isGrayscale, 10, 'Tambah');
    axes(handles.axes1);
    imshow(img);
    setGlobalImg(img);
end


% --- Executes on button press in minus10.
function minus10_Callback(hObject, eventdata, handles)
% hObject    handle to minus10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    img = brightness(img,isGrayscale, 10, 'Kurang');
    axes(handles.axes1);
    imshow(img);
    setGlobalImg(img);
end


% --- Executes on button press in multiply2.
function multiply2_Callback(hObject, eventdata, handles)
% hObject    handle to multiply2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    img = brightness(img,isGrayscale, 2, 'Kali');
    axes(handles.axes1);
    imshow(img);
    setGlobalImg(img);
end


% --- Executes on button press in divide2.
function divide2_Callback(hObject, eventdata, handles)
% hObject    handle to divide2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    img = brightness(img,isGrayscale, 2, 'Bagi');
    axes(handles.axes1);
    imshow(img);
    setGlobalImg(img);
end


% --- Executes on button press in shistogram.
function shistogram_Callback(hObject, eventdata, handles)
% hObject    handle to shistogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    [ histR, histG, histB ] = histogram(img,isGrayscale);
    
    % Histogram R
    axes(handles.axes2);
    bar(histR,'r');
    
    % Histogram G
    axes(handles.axes5);
    bar(histG,'g');
    
    % Histogram B
    axes(handles.axes6);
    bar(histB,'b');
    
    axes(handles.axes1);
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


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0 
    indexTertinggiBaru = str2double(get(handles.edit1, 'String'));
    indexTerendahBaru = str2double(get(handles.edit2, 'String'));
    [ histR, histG, histB ] = histogram_equalisasi(img,isGrayscale, indexTertinggiBaru, indexTerendahBaru);
    
    % Histogram R
    axes(handles.axes2);
    bar(histR,'r');
    
    % Histogram G
    axes(handles.axes5);
    bar(histG,'g');
    
    % Histogram B
    axes(handles.axes6);
    bar(histB,'b');
    
    axes(handles.axes1);
end


% --- Executes on button press in edgedetection.
function edgedetection_Callback(hObject, eventdata, handles)
% hObject    handle to edgedetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
if isempty(img) == 0 
    resultImage = konvolusi(img, 'edge');
    imshow(resultImage);
    setGlobalImg(resultImage);
    setGlobalCheckGrayscale(1);
end

% --- Executes on button press in blur.
function blur_Callback(hObject, eventdata, handles)
% hObject    handle to blur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
if isempty(img) == 0 
    resultImage = konvolusi(img, 'blur');
    imshow(resultImage);
    setGlobalImg(resultImage);
end


% --- Executes on button press in sharpen.
function sharpen_Callback(hObject, eventdata, handles)
% hObject    handle to sharpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
if isempty(img) == 0 
    resultImage = konvolusi(img, 'sharpen');
    imshow(resultImage);
    setGlobalImg(resultImage);
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

function editBawahR_Callback(hObject, eventdata, handles)
% hObject    handle to editBawahR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBawahR as text
%        str2double(get(hObject,'String')) returns contents of editBawahR as a double


% --- Executes during object creation, after setting all properties.
function editBawahR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBawahR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAtasR_Callback(hObject, eventdata, handles)
% hObject    handle to editAtasR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAtasR as text
%        str2double(get(hObject,'String')) returns contents of editAtasR as a double


% --- Executes during object creation, after setting all properties.
function editAtasR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAtasR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in threshold.
function threshold_Callback(hObject, eventdata, handles)
% hObject    handle to threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
batasBawahR = str2double(get(handles.editBawahR, 'String'));
batasAtasR = str2double(get(handles.editAtasR, 'String'));
batasBawahG = str2double(get(handles.editBawahG, 'String'));
batasAtasG = str2double(get(handles.editAtasG, 'String'));
batasBawahB = str2double(get(handles.editBawahB, 'String'));
batasAtasB = str2double(get(handles.editAtasB, 'String'));
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    resultImg = threshold(img, isGrayscale, batasBawahR, batasAtasR, batasBawahG, batasAtasG, batasBawahB, batasAtasB);
    axes(handles.axes1);
    imshow(resultImg);
    assignin('base','threshold',resultImg);
end



function editX_Callback(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editX as text
%        str2double(get(hObject,'String')) returns contents of editX as a double


% --- Executes during object creation, after setting all properties.
function editX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editY_Callback(hObject, eventdata, handles)
% hObject    handle to editY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editY as text
%        str2double(get(hObject,'String')) returns contents of editY as a double


% --- Executes during object creation, after setting all properties.
function editY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in regionGrowth.
function regionGrowth_Callback(hObject, eventdata, handles)
% hObject    handle to regionGrowth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getGlobalImg;
X = str2double(get(handles.editX, 'String'));
Y = str2double(get(handles.editY, 'String'));
thresholdR = str2double(get(handles.editRgR, 'String'));
thresholdG = str2double(get(handles.editRgG, 'String'));
thresholdB = str2double(get(handles.editRgB, 'String'));
isGrayscale = getGlobalCheckGrayscale;
if isempty(img) == 0
    resultImg = regionGrowth(img, isGrayscale, Y, X, thresholdR, thresholdG, thresholdB);
    axes(handles.axes1);
    imshow(resultImg);
end


function editBawahG_Callback(hObject, eventdata, handles)
% hObject    handle to editBawahG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBawahG as text
%        str2double(get(hObject,'String')) returns contents of editBawahG as a double


% --- Executes during object creation, after setting all properties.
function editBawahG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBawahG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAtasG_Callback(hObject, eventdata, handles)
% hObject    handle to editAtasG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAtasG as text
%        str2double(get(hObject,'String')) returns contents of editAtasG as a double


% --- Executes during object creation, after setting all properties.
function editAtasG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAtasG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBawahB_Callback(hObject, eventdata, handles)
% hObject    handle to editBawahB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBawahB as text
%        str2double(get(hObject,'String')) returns contents of editBawahB as a double


% --- Executes during object creation, after setting all properties.
function editBawahB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBawahB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAtasB_Callback(hObject, eventdata, handles)
% hObject    handle to editAtasB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAtasB as text
%        str2double(get(hObject,'String')) returns contents of editAtasB as a double


% --- Executes during object creation, after setting all properties.
function editAtasB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAtasB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRgR_Callback(hObject, eventdata, handles)
% hObject    handle to editRgR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRgR as text
%        str2double(get(hObject,'String')) returns contents of editRgR as a double


% --- Executes during object creation, after setting all properties.
function editRgR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRgR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRgG_Callback(hObject, eventdata, handles)
% hObject    handle to editRgG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRgG as text
%        str2double(get(hObject,'String')) returns contents of editRgG as a double


% --- Executes during object creation, after setting all properties.
function editRgG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRgG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRgB_Callback(hObject, eventdata, handles)
% hObject    handle to editRgB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRgB as text
%        str2double(get(hObject,'String')) returns contents of editRgB as a double


% --- Executes during object creation, after setting all properties.
function editRgB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRgB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
