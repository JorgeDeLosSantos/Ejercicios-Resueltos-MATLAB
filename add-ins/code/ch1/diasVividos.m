clear all;clc;
D=input('D�a de nacimiento: ');
M=input('Mes de nacimiento: ');
A=input('A�o de nacimiento: ');
actual=now;
nac=datenum(A,M,D);
fprintf('\n�Cu�nto has vivido?\n');
fprintf('A�os = %g \n',(actual-nac)/365);
fprintf('Meses = %g \n',(actual-nac)/30);
fprintf('D�as = %g \n',(actual-nac));
fprintf('Horas = %g \n',(actual-nac)*24);
t1 = datetime(A,M,D);
datetime(now); - t1

