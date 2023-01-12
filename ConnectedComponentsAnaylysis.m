function varargout = ConnectedComponentsAnaylysis(varargin)
 
% CONNECTEDCOMPONENTSANAYLYSIS M-file for ConnectedComponentsAnaylysis.fig
%      CONNECTEDCOMPONENTSANAYLYSIS, by itself, creates a new CONNECTEDCOMPONENTSANAYLYSIS or raises the existing
%      singleton*.
%
%      H = CONNECTEDCOMPONENTSANAYLYSIS returns the handle to a new CONNECTEDCOMPONENTSANAYLYSIS or the handle to
%      the existing singleton*.
%
%      CONNECTEDCOMPONENTSANAYLYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONNECTEDCOMPONENTSANAYLYSIS.M with the given input arguments.
%
%      CONNECTEDCOMPONENTSANAYLYSIS('Property','Value',...) creates a new CONNECTEDCOMPONENTSANAYLYSIS or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ConnectedComponentsAnaylysis_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ConnectedComponentsAnaylysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2004 The MathWorks, Inc.

% Edit the above text to modify the response to help ConnectedComponentsAnaylysis

% Last Modified by GUIDE v2.5 21-Apr-2010 17:36:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ConnectedComponentsAnaylysis_OpeningFcn, ...
                   'gui_OutputFcn',  @ConnectedComponentsAnaylysis_OutputFcn, ...
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

% --- Executes just before ConnectedComponentsAnaylysis is made visible.
function ConnectedComponentsAnaylysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ConnectedComponentsAnaylysis (see VARARGIN)

% Choose default command line output for ConnectedComponentsAnaylysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes ConnectedComponentsAnaylysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ConnectedComponentsAnaylysis_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
initialize_gui(gcbf, handles, true);
 
% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end
 
% --- Executes during object creation, after setting all properties.
function imagefileedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imagefileedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function size1edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size1edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function size2edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size2edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function size3edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size3edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
 
% --- Executes during object creation, after setting all properties.
function size4edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size4edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function size5edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size5edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function size6edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size6edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function size7edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size7edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function resultfileedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultfileedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function size8edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size8edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in selectimagebutton.
function selectimagebutton_Callback(hObject, eventdata, handles)
% hObject    handle to selectimagebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FileType='*.jpg;*.jpeg;*.bmp;*.gif';
DlgTile='Open a File';
[fname,fpath]=uigetfile(FileType,DlgTile,100,200);
set(handles.imagefileedit,'String',[fpath,fname]);


% --- Executes on button press in startbutton.
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%read image
waitingBar = waitbar(20,'Please waiting ...') 
 
filename = get(handles.imagefileedit, 'String');
X=imread(filename);
temp = get(handles.size1edit,'string');
if length(temp) == 0
    temp = '0';
end
types(1) = eval(temp);
temp = get(handles.size2edit,'string');
if length(temp) == 0
    temp = '0';
end
types(2) = eval(temp);
temp = get(handles.size3edit,'string');
if length(temp) == 0
    temp = '0';
end
types(3) = eval(temp);
temp = get(handles.size4edit,'string');
if length(temp) == 0
    temp = '0';
end
types(4) = eval(temp);
temp = get(handles.size5edit,'string');
if length(temp) == 0
    temp = '0';
end
types(5) = eval(temp);
temp = get(handles.size6edit,'string');
if length(temp) == 0
    temp = '0';
end
types(6) = eval(temp);
temp = get(handles.size7edit,'string');
if length(temp) == 0
    temp = '0';
end
types(7) = eval(temp);
temp = get(handles.size8edit,'string');
if length(temp) == 0
    temp = '0';
end
types(8) = eval(temp);

typeNum = 0;
for l=1 : length(types)
    if types(l)>0
        typeNum = typeNum + 1;
    else
        break;
    end
end
typeNum = typeNum + 1; 
types(typeNum) = 0;

%%convert image to binary image
% I=rgb2gray(X);
I=im2double(X);
level=graythresh(I);  
BW=im2bw(I,level);     
figure(1);
subplot(221);imshow(X);title('original');
subplot(222);imshow(I);title('gray');
subplot(223);imshow(BW);title('binary');

BW=medfilt2(BW,[5 5]);
subplot(224);imshow(BW);title('filtered');

bwI = BW;
%%output the binary image to a file
imwrite(bwI, [filename, '.bw.jpg']);

%%label connected components in 2-D binary image
%%the input parameter 4 specifies 4-connected objects
[L, num]=bwlabel(bwI,4);

tempBwI = bwI;
tempBwI(:) = 0;

%%don't know how to declare a array
%%have to use this stupid way
connectedCompPixel = types;
connectedCompNum = types;
connectedCompRatio = types;
connectedCompPixel(:) = 0;
connectedCompNum(:) = 0;
connectedCompRatio(:) = 0;

%%go through all the connected components
for j=1:num
    [r,c] = find(L==j)
    connectedCompSize(j) = length(r);
    tempBwI( : ) = 0;
    for k=1:connectedCompSize(j)
        tempBwI(r(k),c(k)) = 1;
    end
    [labeled,numobjects]=bwlabel(tempBwI,4);
    stats=regionprops(labeled,'all');
    majorAxisLength=[stats.MajorAxisLength];
    minorAxisLength=[stats.MinorAxisLength];
    ratio = majorAxisLength/minorAxisLength;
    
    if true %%connectedCompSize(j)<100000
        for h=1 : typeNum
            if h==1
                 if connectedCompSize(j)<=types(h)
                      connectedCompPixel(h) = connectedCompPixel(h) + connectedCompSize(j);
                      connectedCompNum(h) = connectedCompNum(h) + 1;
                      connectedCompRatio(h) = connectedCompRatio(h) + ratio;
                 end
            elseif h==typeNum
                if connectedCompSize(j)>types(h-1)
                      connectedCompPixel(h) = connectedCompPixel(h) + connectedCompSize(j);
                      connectedCompNum(h) = connectedCompNum(h) + 1;
                      connectedCompRatio(h) = connectedCompRatio(h) + ratio;
                end
            else 
                if connectedCompSize(j)>types(h-1) & connectedCompSize(j)<=types(h)
                      connectedCompPixel(h) = connectedCompPixel(h) + connectedCompSize(j);
                      connectedCompNum(h) = connectedCompNum(h) + 1;
                      connectedCompRatio(h) = connectedCompRatio(h) + ratio;
                end
            end
        end
    end    
end

imageSize = size(bwI);
totalImagePixel = imageSize(1)*imageSize(2);

%%output the result to file result.txt
filename = get(handles.resultfileedit, 'String');
fid = fopen(filename, 'w');
fprintf(fid, '==========type of connected components ==========\r\n');
for h=1 : typeNum
    if h==1
        fprintf(fid, 'type[%d] is: [<%d]\r\n', h, types(h));
    elseif h==typeNum
         fprintf(fid, 'type[%d] is: [>%d]\r\n', h, types(h-1));
    else 
        fprintf(fid, 'type[%d] is: [>%d & <%d]\r\n', h, types(h-1), types(h));
    end
end
        
fprintf(fid, '\r\n\r\n==========number of connected components ==========\r\n');
fprintf(fid, 'allConnectedCompNum          -- %d\r\n', num);
for n=1 : typeNum
    fprintf(fid, 'type[%d] ConnectedCompNum     -- %d\r\n', n, connectedCompNum(n));
end
 

fprintf(fid, '\r\n\r\n==========size of connected components ==========\r\n');
fprintf(fid, 'totalImagePixel                -- %d\r\n', totalImagePixel);
allConnectedCompPixel=0;
for n=1 : typeNum
   allConnectedCompPixel = allConnectedCompPixel + connectedCompPixel(n)
end
fprintf(fid, 'allConnectedCompPixel         -- %d\r\n', allConnectedCompPixel);
for n=1 : typeNum
    fprintf(fid, 'type[%d] ConnectedCompPixel    -- %d\r\n', n, connectedCompPixel(n));
end

fprintf(fid, '\r\n\r\n==========percent of connected components ==========\r\n');
fprintf(fid, 'allConnectedCompPercent          -- %d%%\r\n', (allConnectedCompPixel/totalImagePixel)*100);
for n=1 : typeNum
    fprintf(fid, 'type[%d] ConnectedCompPercent     -- %d%%\r\n', n, (connectedCompPixel(n)/totalImagePixel)*100);
end

fprintf(fid, '\r\n\r\n==========ratio of connected components ==========\r\n');
allConnectedCompRatio = 0;
for n=1 : typeNum
    allConnectedCompRatio = allConnectedCompRatio + connectedCompRatio(n);
end
fprintf(fid, 'allConnectedCompRatio          -- %d\r\n', allConnectedCompRatio/num);
for n=1 : typeNum
    fprintf(fid, 'type[%d] ConnectedCompRatio     -- %d\r\n', n,connectedCompRatio(n)/connectedCompNum(n));
end

fclose('all');
delete(waitingBar);
filename = get(handles.resultfileedit, 'String');
% fid = fopen(filename, 'r');
% line = fgets(fid)
result = textread(filename, '%s', 'whitespace', '')
set(handles.resultedit,'String',result);


% --- Executes on button press in selectresultfilebutton.
function selectresultfilebutton_Callback(hObject, eventdata, handles)
% hObject    handle to selectresultfilebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FileType='*.txt';
DlgTile='Open a File';
[fname,fpath]=uigetfile(FileType,DlgTile,100,200);
set(handles.resultfileedit,'String',[fpath,fname]);




function imagefileedit_Callback(hObject, eventdata, handles)
% hObject    handle to imagefileedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of imagefileedit as text
%        str2double(get(hObject,'String')) returns contents of imagefileedit as a double



function resultfileedit_Callback(hObject, eventdata, handles)
% hObject    handle to resultfileedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultfileedit as text
%        str2double(get(hObject,'String')) returns contents of resultfileedit as a double



function size1edit_Callback(hObject, eventdata, handles)
% hObject    handle to size1edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size1edit as text
%        str2double(get(hObject,'String')) returns contents of size1edit as a double



function size2edit_Callback(hObject, eventdata, handles)
% hObject    handle to size2edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size2edit as text
%        str2double(get(hObject,'String')) returns contents of size2edit as a double



function size3edit_Callback(hObject, eventdata, handles)
% hObject    handle to size3edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size3edit as text
%        str2double(get(hObject,'String')) returns contents of size3edit as a double



function size4edit_Callback(hObject, eventdata, handles)
% hObject    handle to size4edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size4edit as text
%        str2double(get(hObject,'String')) returns contents of size4edit as a double



function size5edit_Callback(hObject, eventdata, handles)
% hObject    handle to size5edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size5edit as text
%        str2double(get(hObject,'String')) returns contents of size5edit as a double



function size6edit_Callback(hObject, eventdata, handles)
% hObject    handle to size6edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size6edit as text
%        str2double(get(hObject,'String')) returns contents of size6edit as a double



function size7edit_Callback(hObject, eventdata, handles)
% hObject    handle to size7edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size7edit as text
%        str2double(get(hObject,'String')) returns contents of size7edit as a double



function size8edit_Callback(hObject, eventdata, handles)
% hObject    handle to size8edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size8edit as text
%        str2double(get(hObject,'String')) returns contents of size8edit as a double




% --- Executes on button press in viewresultbutton.
function viewresultbutton_Callback(hObject, eventdata, handles)
% hObject    handle to viewresultbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = get(handles.resultfileedit, 'String');
% fid = fopen(filename, 'r');
% line = fgets(fid)
result = textread(filename, '%s', 'whitespace', '')
set(handles.resultedit,'String',result);


function resultedit_Callback(hObject, eventdata, handles)
% hObject    handle to resultedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultedit as text
%        str2double(get(hObject,'String')) returns contents of resultedit as a double


% --- Executes during object creation, after setting all properties.
function resultedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


