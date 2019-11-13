function varargout = NewtonR(varargin)
% NEWTONR M-file for NewtonR.fig
%      NEWTONR, by itself, creates a new NEWTONR or raises the existing
%      singleton*.
%
%      H = NEWTONR returns the handle to a new NEWTONR or the handle to
%      the existing singleton*.
%
%      NEWTONR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWTONR.M with the given input arguments.
%
%      NEWTONR('Property','Value',...) creates a new NEWTONR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NewtonR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NewtonR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NewtonR

% Last Modified by GUIDE v2.5 13-Nov-2019 10:34:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NewtonR_OpeningFcn, ...
                   'gui_OutputFcn',  @NewtonR_OutputFcn, ...
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


% --- Executes just before NewtonR is made visible.
function NewtonR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NewtonR (see VARARGIN)

% Choose default command line output for NewtonR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NewtonR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NewtonR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close(NewtonR);
Finter;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
toggleValue = get(handles.togglebutton1,'value');

if toggleValue
    set(handles.text1, 'Visible', 'off');
else
    set(handles.text1, 'Visible', 'on');
end

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
