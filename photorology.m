function varargout = photorology(varargin)
% PHOTOROLOGY MATLAB code for photorology.fig
%      PHOTOROLOGY, by itself, creates a new PHOTOROLOGY or raises the existing
%      singleton*.
%
%      H = PHOTOROLOGY returns the handle to a new PHOTOROLOGY or the handle to
%      the existing singleton*.
%
%      PHOTOROLOGY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHOTOROLOGY.M with the given input arguments.
%
%      PHOTOROLOGY('Property','Value',...) creates a new PHOTOROLOGY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before photorology_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to photorology_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help photorology

% Last Modified by GUIDE v2.5 17-Oct-2017 15:02:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @photorology_OpeningFcn, ...
                   'gui_OutputFcn',  @photorology_OutputFcn, ...
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


% --- Executes just before photorology is made visible.
function photorology_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to photorology (see VARARGIN)

% Choose default command line output for photorology
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes photorology wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = photorology_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openIMG.
function openIMG_Callback(hObject, eventdata, handles)
[IMGname,IMGpath] = uigetfile({'*.jpg'; '*.bmp'},'Select Image');
IMGdirectory = strcat(IMGpath,IMGname);
img = imread(IMGdirectory);
imshow(img)
handles.img = img;
guidata(hObject,handles);


% --- Executes on button press in SaveImg.
function SaveImg_Callback(hObject, eventdata, handles)
%guidata(hObject, handles);
img = handles.img;
[IMGname,IMGpath] = uiputfile({'*.jpg';'*.bmp'},'Save Image');
IMGdirectory = strcat(IMGpath,IMGname);
imwrite(img,IMGdirectory);




% --- Executes on button press in IMGframe.
function IMGframe_Callback(hObject, eventdata, handles)
img = handles.img;
img(25:end-25,1:25)=255;
img(25:end-25,end-25:end)=255;
img(1:25,25:end-25)=255;
img(end-25:end,25:end-25)=255;
img(1:25,1:25)=0;
img(end-25:end,1:25)=0;
img(1:25,end-25:end)=0;
img(end-25:end,end-25:end);
handles.img = img;
guidata(hObject,handles);
imshow(img)
%em vez do hObject (se nao tivermos) podemos usar gcbo


% --- Executes on slider movement.
function Brightness_Callback(hObject, eventdata, handles)



guiData(hObject,handles);
x = getimage(handles.axes5);     %vai buscar imagem ao axes5
axes(handles.axes4);    %escolho axes4
A = get(hObject,'Value'); %vai buscar valor do slider
if A>0
   brightness = imajust(x,[0;1-A],[A;1]); %para aummentar brilho
else
   brightness = imajust(x,[0.9;1],[0;1]);
end
imshow(brightness);






%get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% --- Executes during object creation, after setting all properties.
function Brightness_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function Contrast_Callback(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Gama_Callback(hObject, eventdata, handles)
% hObject    handle to Gama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider 


% --- Executes during object creation, after setting all properties.
function Gama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
