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
        n1 = get(hN1,'String'); % Primer n�mero
        n2 = get(hN2,'String'); % Segundo n�mero
        oper = get(src,'String'); % Operador
        set(hR,'String',num2str(eval([n1,oper,n2])));
    end

end