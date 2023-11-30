% Função principal da geração de trajétoria
% Recebe como parâmetros os gráficos a serem plotados, matriz de transformação da posição
% inicial, Pi, e final, Pf, o tempo e passo da simulação
function a=trajetoria(plotsT,plotCima, plotBaixo, Pi,Pf,tempo,passo,l1,l2,select)
tf=tempo; T=passo; t=0:T:tf; ji=inversa(l1,l2,Pi); jf=inversa(l1,l2,Pf);
% Geração de trajetória com a função do polinômio cúbico
for i=1:(tf/T+1);
% dji -> posição junta i
% ddji -> Velocidade junta i
% dddji -> Aceleração junta i
[dj1(i),ddj1(i),dddj1(i)]=polin(ji(1),jf(1),tf,t(i));
[dj2(i),ddj2(i),dddj2(i)]=polin(ji(2),jf(2),tf,t(i));
[dj3(i),ddj3(i),dddj3(i)]=polin(ji(3),jf(3),tf,t(i));
[dj4(i),ddj4(i),dddj4(i)]=polin(ji(4),jf(4),tf,t(i));
[dj5(i),ddj5(i),dddj5(i)]=polin(ji(5),jf(5),tf,t(i));
[dj6(i),ddj6(i),dddj6(i)]=polin(ji(6),jf(6),tf,t(i));
end
% aplicativo
plotMovimento(l1,l2,(tf/T+1),round(dj1,1,"decimals"),round(dj2,1,"decimals"),
round(dj3,1,"decimals"),plotCima,plotBaixo,select,T);
% juntas do robô
plot(plotsT(1,1),t,round(dj1,1,"decimals"));
plot(plotsT(1,2),t,ddj1);
plot(plotsT(1,3),t,dddj1);
plot(plotsT(2,1),t,round(dj2,1,"decimals"));
plot(plotsT(2,2),t,round(ddj2,1,"decimals"));
plot(plotsT(2,3),t,round(dddj2,1,"decimals"));
plot(plotsT(3,1),t,round(dj3,1,"decimals"));
plot(plotsT(3,2),t,round(ddj3,1,"decimals"));
plot(plotsT(3,3),t,round(dddj3,1,"decimals"));
plot(plotsT(4,1),t,round(dj4,1,"decimals"));
47
plot(plotsT(4,2),t,round(ddj4,1,"decimals"));
plot(plotsT(4,3),t,round(dddj4,1,"decimals"));
plot(plotsT(5,1),t,round(dj5,1,"decimals"));
plot(plotsT(5,2),t,round(ddj5,1,"decimals"));
plot(plotsT(5,3),t,round(dddj5,1,"decimals"));
plot(plotsT(6,1),t,round(dj6,1,"decimals"));
plot(plotsT(6,2),t,round(ddj6,1,"decimals"));
plot(plotsT(6,3),t,round(dddj6,1,"decimals"));
end
% Função polin, calculo das equações do polinômio cúbico
function [d,dd,ddd] = polin(di,df,tf,t) a0=di;
a1=0;
a2=(3/(tf^2))*(df-di);
a3=-(2/(tf^3))*(df-di);
d=a0+a1*t+a2*t^2+a3*t^3;
dd=a1+2*a2*t+3*a3*t^2;
ddd=2*a2+6*a3*t;
end
% Função plotMovimento, gera uma animação para a geração de trajetória
function a = plotMovimento(l1,l2,T,t1,t2,t3,plotCima,plotBaixo,select,p)
a=pi/180; p=p/10
for i=1:T
P13(1,i)=l1*cos(t1(i)*a)*cos(t2(i)*a);
P13(2,i)=l1*cos(t2(i)*a)*sin(t1(i)*a);
P13(3,i)=-l1*sin(t2(i)*a);
P14(1,i)=cos(t1(i)*a)*(cos(t2(i)*a)*(l1 - l2*sin(t3(i)*a)) - l2*cos(t3(i)*a)*sin(t2(i)*a));
P14(2,i)=sin(t1(i)*a)*(cos(t2(i)*a)*(l1 - l2*sin(t3(i)*a)) - l2*cos(t3(i)*a)*sin(t2(i)*a));
P14(3,i)= -sin(t2(i)*a)*(l1 - l2*sin(t3(i)*a)) - l2*cos(t2(i)*a)*cos(t3(i)*a);
end
b=-l1*0.2;
48
for i=1:T
plot3(plotCima,[0,0],[0,0],[b,0],’LineWidth’,6,’Color’,’blue’); hold(plotCima);
plot3(plotCima,[0,P13(1,i)],[0,P13(2,i)],[0,P13(3,i)],’LineWidth’,4,’Color’,’red’);
plot3(plotCima,[P13(1,i),P14(1,i)],[P13(2,i),P14(2,i)],[P13(3,i),P14(3,i)],’LineWidth’,4,
’Color’,’green’);
hold(plotCima);
if select == 1
plot(plotBaixo,[0,0],[b,0],’LineWidth’,6,’Color’,’blue’);
hold(plotBaixo);
plot(plotBaixo,[0,P13(1,i)],[0,P13(3,i)],’LineWidth’,4,’Color’,’red’);
plot(plotBaixo,[P13(1,i),P14(1,i)],[P13(3,i),P14(3,i)],’LineWidth’,4,’Color’,’green’);
hold(plotBaixo);
else
plot(plotBaixo,[0,P13(1,i)],[0,P13(2,i)],’LineWidth’,4,’Color’,’red’);
hold(plotBaixo);
plot(plotBaixo,[P13(1,i),P14(1,i)],[P13(2,i),P14(2,i)],’LineWidth’,4,’Color’,’green’);
hold(plotBaixo);
end
pause(p);
end
hold(plotCima);
plot3(plotCima,P14(1,:),P14(2,:),P14(3,:),’-’);
hold(plotCima);
end