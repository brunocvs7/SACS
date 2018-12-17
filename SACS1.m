function varargout = SACS1(varargin)
% SACS1 MATLAB code for SACS1.fig
%      SACS1, by itself, creates a new SACS1 or raises the existing
%      singleton*.
%
%      H = SACS1 returns the handle to a new SACS1 or the handle to
%      the existing singleton*.
%
%      SACS1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SACS1.M with the given input arguments.
%
%      SACS1('Property','Value',...) creates a new SACS1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SACS1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SACS1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SACS1

% Last Modified by GUIDE v2.5 23-Dec-2017 16:37:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SACS1_OpeningFcn, ...
                   'gui_OutputFcn',  @SACS1_OutputFcn, ...
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


% --- Executes just before SACS1 is made visible.
function SACS1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SACS1 (see VARARGIN)

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]);

% import the background image and show it on the axes
%bg = imread('E:\Users\Bruno Carlos\Desktop\imagem1.png'); imagesc(bg);

%prevent plotting over the background and turn the axis oft
set(ah,'handlevisibility','off','visible','off');

%making sure the background is behind all the other uicontrols
uistack(ah, 'bottom')
% Choose default command line output for SACS1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SACS1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SACS1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.xlsx'},'Select Folder');
 cd(pathname);
 [a,gabarito,c] = xlsread(filename);
setappdata(0,'gabarito',gabarito);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg'},'Select Folder');
 cd(pathname);
 pasta_idioma1 = pathname;
 setappdata(0,'pasta_idioma1',pasta_idioma1);
 string = '*.jpg';
 auxiliar = strcat(pathname,string);
D = dir(auxiliar);

f = 1;
% Uma vez que o diretório é setado, carregamos todas as imagens dos cartoes-
%resposta dos alunos

imcell = cell(1,numel(D));

for q = 1:numel(D)
  imcell{q} = imread(D(q).name);
end
% Selecionando matriz como o argumento da celula na dimensao 1
     for s=1:length(imcell)
    matriz = double(cell2mat(imcell(s)));
    matriz = matriz(:,:,1);


cont1 = 0;
    % Esse primeiro for é pra varrer as colunas de pixels
                          for i =47:178:937
% Esse segundo for é pra varrer as linhas de pixels
              for x =15:30:435
    
w = 1;


cont = 0;


j = i;
y = j + 15;
% Esse while é pra percorer as cinco circunferencias (A, B, C e D) e ver
% qual foi marcada
% w é o número de bolinhas, ou seja, 5
   while w <= 5
    % esse while é pra atravessar a bolinha a partir de seu centro
% poderia ser um for também
        while j <=y
        cont = cont + matriz(x,j);
        j = j+1;
         end
    m(w) = cont;
    cont = 0;
    j = j + 6;
    y = j + 20;
    w = w+1;
   end

cont1 = cont1 +1;
p = find(m == min(m));% Encontra o mínimo valor do vetor. A posição desse valor 
% no vetor corresponde a alternativa marcada

% Aqui verificamos se o aluno marcou mais de uma altenativa ou deixou a
% questao em branco
  for v =1:5
         if m(v) < 2100
            aa(v) =1;
         else
           aa(v) = 0;
         end
  end
   
soma = sum(aa);

% O vetor r abaixo é o vetor resposta, utilizamos '-' para caso ele deixe a
% questao em branco ou marque mais de uma alternativa
if soma > 1
    r{cont1} = '-';
elseif soma  == 0
    r{cont1} = '-';
elseif p == 1
    r{cont1} = 'A';
elseif p ==2
    r{cont1} = 'B';
elseif p ==3
    r{cont1} = 'C';
elseif p == 4
    r{cont1} = 'D';
else
    r{cont1} = 'E';
    
end

                     end

                          end
r = r';
rr(:,f) = r;

f = f+1;

% No fim desses loops temos a matriz rr que corresponde a matriz com todas
% as respostas de todos os alunos que responderam a prova com as questoes
% de espanhol ou ingles
     end
         
     % Aqui é pra guardar o nmoe dos alunos numa célula
for i=1:length(D)
d{i} = D(i).name;
end
setappdata(0,'d',d);
idioma = get(handles.popupmenu1,'Value');

if idioma == 2
    idioma = 'I';
elseif idioma == 3
    idioma = 'E';
end
for sss =1:length(D)
    ddd{sss} = idioma;
end
setappdata(0,'ddd',ddd);
% Exportar é uma tabela que tem no cabeçalho o nome dos alunos e logo
% abaixo as respectivas alternativas marcadas para as 90 questoes. A ultima
% linha corresponde a opção E ou I, que é pra espanhol ou ingles, que será
% usado na comparação do gabarito.
getappdata(0,'d');
getappdata(0,'d');
exportar = [d;rr;ddd];
%exportando os resultados
[filename path] = uiputfile('*.xlsx','Escolha o local em que deseja salvar o arquivo');
pasta_salvou_leitura1 = path;
nome_do_arquivo_leitura1 = filename;
xlswrite(filename,exportar);
setappdata(0,'respostas',exportar);
setappdata(0,'idioma',idioma);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete = 1;
respostas = getappdata(0,'respostas');
idioma = getappdata(0,'idioma');
gabarito= getappdata(0,'gabarito');
gabarito = char(gabarito);
d = getappdata(0,'d');
respostas(delete, :) = [];
[x y] = size(respostas);
respostas = cell2mat(respostas);

% Comparação das respostas de cada aluno com o gabarito
if idioma == 'E'
    gabarito(1:3,:) = [];
else
      gabarito(4:6,:) = [];  
end
    
    for j=1:y
           for i = 1:90
                    if respostas(91,j) == 'E'
                         
                                if gabarito(i) == '-'
                                 correcao(i,j) =1;
                               elseif respostas(i,j) == gabarito(i)
                                    correcao(i,j) = 1;
                                 else
                                  correcao(i,j) = 0;
                                end
                    else
                          
                                                            
                              if gabarito(i) == '-'
                             correcao(i,j) =1;
                              elseif respostas(i,j) == gabarito(i)
                             correcao(i,j) = 1;
                              else
                            correcao(i,j) = 0;
                              end
                    end      
            end 
    
    
    end
     %Esse próximo for é pra contar quantas questoes cada uma certou por
     %área
    
                                        for i=1:y
                                        ch(i) = sum(correcao(24:46,i));
                                        cn(i) = sum(correcao(68:90,i));
                                        li(i) = sum(correcao(1:23,i));
                                        mt(i) = sum(correcao(47:67,i));
                      
                                        end
              %Transformação de variáveis                          
ch = num2cell(ch);
cn = num2cell(cn);
li = num2cell(li);
mt = num2cell(mt);

resultado = [d;li;ch;mt;cn;];
resultado = resultado';

% Exportando a quantidade de acertos de cada aluno por área
                      
         [filename path] = uiputfile('*.xlsx', 'Escolha o local em que deseja salvar seu arquivo');
           cd(path);
      xlswrite(filename, resultado);
   

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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[arquivo, caminho] = uigetfile({'*.xlsx'},'Escolha seus arquivos');
cd(caminho);
D = dir(path);
for i=1:2
e{i} = D(i+2).name
end
[aa,cc,arquivo1] = xlsread(e{1});
[aaa,ccc,arquivo2] = xlsread(e{2});
nomes = [cc;ccc];

N_acertos_alunos = [aa;aaa]';
for i =1:4
       medias(i) = floor(mean(N_acertos_alunos(i,:)));
    end
    % Separando cada vetor de acertos
    
      Hu = N_acertos_alunos(2,:);
      Li = N_acertos_alunos(1,:);
      Na = N_acertos_alunos(4,:);
      Ma = N_acertos_alunos(3,:);

    % Cálculo do desvio de acertos por área
    for i = 1:length(Na)
      desvio_natureza(i) = Na(i) - medias(4);
      desvio_linguagens(i) = Li(i) - medias(1);
      desvio_humanas(i) = Hu(i) - medias(2);
      desvio_matematica(i) = Ma(i) - medias(3);
    end
    % Cálculo da média dos desvios
    
    me_ds_na = mean(abs(desvio_natureza));
    me_ds_li = mean(abs(desvio_linguagens));
    me_ds_hu = mean(abs(desvio_humanas));
    me_ds_ma = mean(abs(desvio_matematica));
    
    %Calculo da nota a partir de 500, pode ser pra mais se o desvio da
    %media for positivo, ou pra menos se o desvio da media for negativo
    for i = 1:length(Na)
      notas_na(i) = 500 + ((desvio_natureza(i))/(me_ds_na))*100;
      notas_li(i) = 500 + ((desvio_linguagens(i))/(me_ds_li))*100;
      notas_hu(i) = 500 + ((desvio_humanas(i))/(me_ds_hu))*100;
      notas_ma(i) = 500 + ((desvio_matematica(i))/(me_ds_ma))*100;
    end
    %Exportando as notas definitivas
    Notas = [notas_li; notas_hu; notas_ma; notas_na]';
    Notas = num2cell(Notas);
    
    Notas = [nomes,Notas];
   
    [arquivo, caminho] = uiputfile({'*.xlsx'},'Escolha o Local em que deseja salvar seu arquivo');
    xlswrite(arquivo, Notas);
