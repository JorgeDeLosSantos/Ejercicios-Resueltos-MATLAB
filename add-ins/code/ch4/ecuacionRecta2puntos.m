clear all;clc;
x1=input('x1: ');
y1=input('y1: ');
x2=input('x2: ');
y2=input('y2: ');
m=(y2-y1)/(x2-x1);
b=(-x1*m)+y1;
if b<0
    signo='- ';
elseif b>0 
    signo='+ ';
else
    signo='';
    b='';
end 
if m==1
    m='';
end
y=['y = ',num2str(m),' x ',signo,num2str(abs(b))];
fprintf('\nEcuaci�n de la recta:  %s\n\n',y);
