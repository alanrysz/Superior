function varargout = finter(varargin)
% FINTER M-file for finter.fig
%      FINTER, by itself, creates a new FINTER or raises the existing
%      singleton*.
%
%      H = FINTER returns the handle to a new FINTER or the handle to
%      the existing singleton*.
%
%      FINTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINTER.M with the given input arguments.
%
%      FINTER('Property','Value',...) creates a new FINTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before finter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to finter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finter

% Last Modified by GUIDE v2.5 28-Nov-2019 08:10:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finter_OpeningFcn, ...
                   'gui_OutputFcn',  @finter_OutputFcn, ...
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


% --- Executes just before finter is made visible.
function finter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to finter (see VARARGIN)

% Choose default command line output for finter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes finter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = finter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
Ncolumns=2;
Nrows=4;
set(handles.tableField,'Data',cell(Nrows,Ncolumns));


function edit6_Callback(hObject, eventdata, handles)
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


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
data = get(handles.tableField,'data');

    arrayX = [];
    arrayY = [];
    count = size(data,1);
    for j = 1:count
        disp(data{j,1});
        arrayX = [arrayX, str2double(data{j,1})];
        arrayY = [arrayY, str2double(data{j,2})];
    end
    
  equid=1;
    cont=2;
    resultadoOriginal=0;
    while equid==1 && cont <= length(arrayX)
        if cont == 2
            resultadoOriginal= arrayX(cont) - arrayX(cont-1);
            cont = cont+1;
        elseif resultadoOriginal== arrayX(cont) - arrayX(cont-1)
            cont=cont+1;
        else
            equid = 0;
        end
    end
    
    if (equid == 1)
    set(handles.text20, 'String', 'Si');
    else
    set(handles.text20, 'String', 'No');
    end


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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
close(finter);


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
toggleValue = get(handles.togglebutton1,'value');

if toggleValue
    set(handles.text8, 'Visible', 'off');
else
    set(handles.text8, 'Visible', 'on');
end



% --- Executes when selected object is changed in uipanel4.
function metodos_SelectionChangeFcn(hObject, eventdata, handles)

data = get(handles.tableField,'Data');

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
    
    
   sum=0;
    pasos = zeros(length(arrayX),length(arrayX));
    cont=1;
    for i=1:length(arrayX)
        p=1;
        for j=1:length(arrayX)
            if j~=i
                c = poly(arrayX(j))/(arrayX(i)-arrayX(j));
                p = conv(p,c);
            end
        end
        for t=1:length(p)
        pasos(cont, t)=p(t);
        end
        term = p*arrayY(i);
        sum= sum + term;
        cont = cont+1;
    end
      d = 0;  
      t='';
   for n=1:length(arrayX)
       disp((poly2sym(pasos(n,:))));
    %   List{n}=char(poly2sym(pasos(n,:)));
    t=strcat(t,'L');
    t=strcat(t,int2str(n-1));
    t=strcat(t,': ');
        t=strcat(t,' (');
        t=strcat(t,char(poly2sym(pasos(n,:))));
        t=strcat(t,')     +  ');

    end
    
        set(handles.text8,'String', t);



    
elseif hObject == handles.radiobutton2
     
    L = newton_regre(arrayX, arrayY);
    set(handles.text10, 'String', char((L)));
    
    D = regresiva_pasos(arrayX, arrayY);
    set(handles.text8, 'String', num2str(D));
   
     
     
else
     P = NewtonP(arrayX, arrayY);
     set(handles.text10, 'String', char(poly2sym(P)));
     
     E = NewtonPPasos(arrayX, arrayY);
     set(handles.text8, 'String', num2str(E));
        
end
