﻿# Interfaces gráficas de usuario

Comunmente se denomina interfaz gráfica de usuario (GUI) a un conjunto
de objetos gráficos mostrados en una ventana, que el usuario de un
ordenador utiliza para interactuar con el sistema operativo o el
software en ejecución. En MATLAB las GUI normalmente incluyen botones,
campos de texto, check boxes, menús desplegables, list boxes, tablas,
entre otros que facilitan la interacción del usuario. Cada uno de estos
elementos gráficos es programado para responder a una determinada acción
realizada por el usuario.

## El hola mundo en GUI

*Desarrolle una interfaz gráfica que contenga un botón, el cual al ser
presionado por el usuario deberá *responder* mostrando un cuadro de
dialogo (msgbox) con la clásica cadena *hola mundo*.*

    function HolaMundo
    figure('MenuBar','None',...
        'NumberTitle','off',...
        'Name','Hola Mundo');
     
    uicontrol('style','push',...
        'String','Botón',...
        'Callback','msgbox(''Hola mundo'')');
    end


## Ventana multicolor

*Programe una interfaz gráfica que no contenga control gráfico alguno, y
que solamente cambie de color a cada cierto tiempo, esto hasta que el
usuario cierre la ventana correspondiente.*

    function CambiaColor
    f = figure('MenuBar','none',...
        'NumberTitle','off',...
        'Name','Cambia Color');
     
    while ishandle(f)
        set(f,'Color',rand(1,3));
        pause(0.5);
        drawnow;
    end
     
    end


## Lista de archivos M.

*Desarrolle una GUI con un List Box, el cual debe contener una lista de
los nombres de archivos \*.m ubicados en el mismo directorio. Al
presionar cada uno de los elementos de la lista debe abrir el archivo
seleccionado en el editor de MATLAB.*

    function ListaArchivosM
    figure('MenuBar','none',...
        'NumberTitle','off',...
        'Name','Lista Archivos',...
        'Position',[0 0 200 300]);
    centerfig();
     
    archivos_m = dir('*.m');
    archivos_m = struct2cell(archivos_m);
    uicontrol('style','listbox',...
        'String',archivos_m(1,:),...
        'Units','Normalized',...
        'Position',[0.02 0.02 0.96 0.96],...
        'Callback',@edit_call);
     
        function edit_call(src,~)
            str = get(src,'String');
            k = get(src,'Value');
            edit(str{k});
        end
    end

## Mini Calculadora

*Diseñe y desarrolle una interfaz gráfica de usuario que asemeje el
comportamiento de una calculadora muy sencilla. Debe contener cuatro
botones correspondientes a los operadores aritméticos básicos, dos
campos editables que permitan insertar los datos de entrada y otro campo
estático o editable que permita mostrar el resultado de la operación
realizada.*

    function MiniCalculadora
    figure('MenuBar','None',...
        'NumberTitle','off',...
        'Name','Mini Calculadora',...
        'Resize','off',...
        'Position',[0 0 300 150]);
    centerfig();
     
    % ============================= DATOS ===============================
    panel_datos = uipanel('Units','Pixels',...
        'Position',[10 50 280 95]);
     
    uicontrol(panel_datos,'Style','text',...
        'String','# 1',...
        'Units','Normalized',...
        'Position',[0 0.67 0.4 0.25]);
    hN1=uicontrol(panel_datos,'Style','edit',...
        'String','',...
        'Units','Normalized',...
        'Position',[0.45 0.72 0.5 0.25]);
     
    uicontrol(panel_datos,'Style','text',...
        'String','# 2',...
        'Units','Normalized',...
        'Position',[0 0.33 0.4 0.25]);
    hN2=uicontrol(panel_datos,'Style','edit',...
        'String','',...
        'Units','Normalized',...
        'Position',[0.45 0.38 0.5 0.25]);
     
    uicontrol(panel_datos,'Style','text',...
        'String','Resultado',...
        'Units','Normalized',...
        'Position',[0 0 0.4 0.25]);
    hR=uicontrol(panel_datos,'Style','edit',...
        'String','',...
        'Units','Normalized',...
        'Position',[0.45 0.05 0.5 0.25],...
        'BackG',ones(1,3)*0.8);
     
    % ===================== BOTONES OPERADORES ============================
    panel_botones = uipanel('Units','Pixels',...
        'Position',[10 5 280 40]);
     
    OPERADORES = '+-*/';
     
    for k = 1:length(OPERADORES)
        uicontrol(panel_botones,'style','push',...
            'String',OPERADORES(k),...
            'Units','normalized',...
            'Position',[(k-1)*(1/4) 0 1/4 1],...
            'FontSize',16,...
            'FontWeight','bold',...
            'Callback',@calcular);
    end
     
        function calcular(src,~)
            n1 = get(hN1,'String'); % Primer número
            n2 = get(hN2,'String'); % Segundo número
            oper = get(src,'String'); % Operador
            set(hR,'String',num2str(eval([n1,oper,n2])));
        end
     
    end


## Visor de imágenes (Nivel I)

*Desarrolle una GUI que funcione como un visor de imágenes simple, el
cual debe contener un menú Archivo y dentro de este dos sub-menús
llamados Abrir y Salir. La opción Abrir debe mostrar al usuario un
explorador de archivos interactivo (uigetfile) que le permita
seleccionar una imagen en formato PNG y enseguida mostrarla en un axes
ubicado dentro la misma GUI (utilice las funciones imread e imshow para
la manipulación de la imagen). La opción Salir, en este caso, es
auto-descriptiva.*

    function AbrirImagen
    f = figure('MenuBar','None',...
        'NumberTitle','off',...
        'Name','Abrir imagen');

    % ====================== MENÚ ============================
    hMenu = uimenu(f,'Label','Archivo');
    uimenu(hMenu,'Label','Abrir','Callback',@abrir_img);
    uimenu(hMenu,'Label','Salir','Callback','close(gcf)');

    % ===================== AXES ============================
    ax = axes('Units','Normalized',...
        'Position',[0 0 1 1],...
        'Visible','off');

        function abrir_img(~,~)
            [filename, pathname] = uigetfile('*.PNG', 'Seleccione una imagen');
            if isequal(filename,0) || isequal(pathname,0)
                return;
            else
                X = imread(fullfile(pathname,filename));
                imshow(X);
            end
        end
    end
