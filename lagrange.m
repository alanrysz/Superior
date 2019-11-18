function varargout = lagrange(varargin)
% LAGRANGE M-file for lagrange.fig
%      LAGRANGE, by itself, creates a new LAGRANGE or raises the existing
%      singleton*.
%
%      H = LAGRANGE returns the handle to a new LAGRANGE or the handle to
%      the existing singleton*.
%
%      LAGRANGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAGRANGE.M with the given input arguments.
%
%      LAGRANGE('Property','Value',...) creates a new LAGRANGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lagrange_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lagrange_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lagrange

% Last Modified by GUIDE v2.5 13-Nov-2019 16:36:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lagrange_OpeningFcn, ...
                   'gui_OutputFcn',  @lagrange_OutputFcn, ...
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


% --- Executes just before lagrange is made visible.
function lagrange_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lagrange (see VARARGIN)
set(handles.static_inter, 'String', varargin{1});
set(handles.static_inter2, 'String', varargin{2});
% Choose default command line output for lagrange
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lagrange wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lagrange_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in pushbutton1.
  
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close(lagrange);
Finter;


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
toggleValue = get(handles.togglebutton3,'value');

if toggleValue
    set(handles.text1, 'Visible', 'off');
else
    set(handles.text1, 'Visible', 'on');
end
% Hint: get(hObject,'Value') returns toggle state of togglebutton3



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%valores para prueba, hay que conectar cada fila con x e y
x = [0,1,2,3,4,5,6];
 y = [0 .8415 0.9093 0.1411 -0.7568 -0.9589 -0.2794];
sum=0;

    for i=1:length(x)
        p=1;
        for j=1:length(x)
            if j~=i
                c = poly(x(j))/(x(i)-x(j));
                kk = roots(c);
                disp(kk);
                p = conv(p,c);
            end
        end
        term = p*y(i);
        sum= sum + term;
    end
    disp(sum);
    
    sum = sum + y(i)*p;
    
    set(handles.mostrarFormula, 'String', sum);
