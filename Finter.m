function varargout = Finter(varargin)
%FINTER M-file for Finter.fig
%      FINTER, by itself, creates a new FINTER or raises the existing
%      singleton*.
%
%      H = FINTER returns the handle to a new FINTER or the handle to
%      the existing singleton*.
%
%      FINTER('Property','Value',...) creates a new FINTER using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Finter_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      FINTER('CALLBACK') and FINTER('CALLBACK',hObject,...) call the
%      local function named CALLBACK in FINTER.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Finter

% Last Modified by GUIDE v2.5 13-Nov-2019 00:11:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Finter_OpeningFcn, ...
                   'gui_OutputFcn',  @Finter_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Finter is made visible.
function Finter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Finter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Finter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Finter_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    close(Finter);
    lagrange;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
 close(Finter);
 NewtonP;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
close(Finter);
NewtonR;



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
close(Finter);


% --- Executes on button press in addCallback.
function addCallback_Callback(hObject, eventdata, handles)
data = get(handles.tableField, 'data');
data(end+1,:) = {[]};
set(handles.tableField, 'data', data);


% --- Executes on button press in removeCallback.
function removeCallback_Callback(hObject, eventdata, handles)
data = get(handles.tableField, 'data');
data(end-1,:) = []; 
set(handles.tableField, 'data', data)

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
Ncolumns=2;
Nrows=10;
set(handles.tableField,'Data',cell(Nrows,Ncolumns));
