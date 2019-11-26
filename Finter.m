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

% Last Modified by GUIDE v2.5 25-Nov-2019 18:54:49

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



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
close(Finter);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
Ncolumns=2;
Nrows=4;
set(handles.tableField,'Data',cell(Nrows,Ncolumns));


function n1_Callback(hObject, eventdata, handles)
input = str2double(get(hObject,'string'));
if isnan(input)
  errordlg('Debe Ingresar un valor Numerico','Invalid Input','modal')
  uicontrol(hObject)
  return
else
  display(input);
end

filas = str2double(get(handles.n1,'String'));
columnas = 2;

num_elem = cell(filas,columnas);
num_elem(:,:)= {''};

set(handles.tableField, 'Data', num_elem);
set(handles.tableField, 'ColumnEditable', true(1,columnas));
set(handles.text13, 'String', filas-1);

P = esEqui(arrayX);
set(handles.text20, 'String', (P));



% Hints: get(hObject,'String') returns contents of n1 as text
%        str2double(get(hObject,'String')) returns contents of n1 as a double


% --- Executes during object creation, after setting all properties.
function n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n1 (see GCBO)
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


% --- Executes on button press in pushbutton13.

function togglebutton1_Callback(hObject, eventdata, handles)
toggleValue = get(handles.togglebutton1,'value');

if toggleValue
    set(handles.text8, 'Visible', 'off');
else
    set(handles.text8, 'Visible', 'on');
end




% --- Executes on button press in radio1.


% --- Executes when selected object is changed in metodos.
function metodos_SelectionChangeFcn(hObject, eventdata, handles)

data = get(handles.tableField,'data');

    arrayX = [];
    arrayY = [];
    count = size(data,1);
    for j = 1:count
        disp(data{j,1});
        arrayX = [arrayX, str2double(data{j,1})];
        arrayY = [arrayY, str2double(data{j,2})];
    end
    
if hObject == handles.radiobutton1
    P = lagrange_interpol(arrayX, arrayY);
    set(handles.text10, 'String', char(poly2sym(P)));
    
    S = lagrangePasos(arrayX,arrayY);
    
    
    for n=1:length(arrayX)
        set(handles.text8, 'String', char(poly2sym(S(n,:))));
    end

    
elseif hObject == handles.radiobutton2
     
    
    set(handles.text10, 'String', char(newton_regre(arrayX, arrayY)));
    
    D = regresiva_pasos(arrayX, arrayY);
    set(handles.text8, 'String', num2str(D));
   
     
     
else
     P = NewtonP(arrayX, arrayY);
     set(handles.text10, 'String', char(poly2sym(P)));
     
     E = NewtonPPasos(arrayX, arrayY);
     set(handles.text8, 'String', num2str(E));
        
end


% --- Executes when selected cell(s) is changed in tableField.
% hObject    handle to tableField (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)


    
    
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)



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


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)

data = get(handles.tableField,'data');

    arrayX = [];
    arrayY = [];
    count = size(data,1);
    for j = 1:count
        disp(data{j,1});
        arrayX = [arrayX, str2double(data{j,1})];
        arrayY = [arrayY, str2double(data{j,2})];
    end
    
   N = str2double(get(handles.edit6, 'String'));
   
   
   C = NewtonP(arrayX, arrayY);

   set(handles.text16, 'String', polyvalm(C,N)); 
 
% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    data = get(handles.tableField,'data');

    arrayX = [];
    arrayY = [];
    count = size(data,1);
    for j = 1:count
        disp(data{j,1});
        arrayX = [arrayX, str2double(data{j,1})];
        arrayY = [arrayY, str2double(data{j,2})];
    end
    
   N = str2double(get(handles.edit6, 'String'));
   
   
   C = NewtonP(arrayX, arrayY);
  
   L = polyfit(C);

    set(handles.text17, 'String', L);


% --- Executes during object creation, after setting all properties.
function text10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text10 (see GCBO)x
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles)
 data = get(handles.tableField,'data');

    arrayX = [];
    arrayY = [];
    count = size(data,1);
    for j = 1:count
        disp(data{j,1});
        arrayX = [arrayX, str2double(data{j,1})];
        arrayY = [arrayY, str2double(data{j,2})];
    end
set(handles.text8, 'String', regresiva_pasos(arrayX,arrayY));


% --- Executes during object creation, after setting all properties.
