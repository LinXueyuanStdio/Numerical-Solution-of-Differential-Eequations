function [k,X,Y,fxy,wch,wucha,P]=RK4 (funfcn,fun,x0,b,C,y0,h)
x=x0; y=y0;p=128; n=fix((b-x0)/h); fxy=zeros(p,1);
wucha=zeros(p,1); wch=zeros(p,1); X=zeros(p,1);
Y=zeros(p,length(y)); k=1; X(k)=x; Y(k,:)=y';
% 绘图.
clc,x,h,y 
%计算 
%fxy=fxy(:);
for k=2:n+1
x=x+h;
a2=C(5);a3=C(6); a4=C(7);
b21=C(8); 
b31=C(9); b32=C(10);
b41=C(11); b42=C(12); b43=C(13);
c1=C(1);c2=C(2); c3=C(3); c4=C(4); 
x1=x+a2*h; x2=x+a3*h; x3=x+a4*h; 
k1=feval(funfcn,x,y); 
y1=y+b21*h*k1;
k2=feval(funfcn,x1,y1); 
y2=y+b31*h*k1+b32*h*k2;
k3=feval(funfcn,x2,y2); 
y3=y+b41*h*k1+b42*h*k2+b43*h*k3;
k4=feval(funfcn,x3,y3); 
fxy(k)=feval(fun,x);
y=y+h*(c1*k1+c2*k2+c3*k3+c4*k4);
X(k)=x; Y(k,:)=y; 
k=k+1; 
end
plot(X,Y,'rp',X,fxy,'bo'), grid
xlabel('自变量 X'), ylabel('因变量 Y')
legend('用四阶龙格-库塔方法计算dy/dx=f(x,y)，y(x0)=y0在[x0,b]上的数值解','y/dx=f(x,y)，y(x0)=y0的精确解y=f(x)')
%计算误差.
for k=2:n+1
wucha(k)=norm(Y(k-1)-Y(k)); 
wch(k)=norm(fxy(k)-Y(k));
end
X=X(1:k); Y=Y(1:k,:);fxy=fxy(1:k,:);
n=1:k;wucha=wucha(1:k,:);
wch=wch(1:k,:); 
P=[n',X,Y,fxy,wch,wucha];