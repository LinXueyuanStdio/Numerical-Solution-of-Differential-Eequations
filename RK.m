function [k,X,Y,fxy,X2,Y2,X3,Y3]=RK (funfcn,fun,x0,b,C,y0,h)
x=x0; y=y0; p=128;
n=fix((b-x0)/h);
fxy=zeros(p,1);X=zeros(p,1);Y=zeros(p,length(y));
k=1; X(k)=x; Y(k,:)=y';
%计算 
a2=C(5);a3=C(6); a4=C(7);
b21=C(8); 
b31=C(9); b32=C(10);
b41=C(11); b42=C(12); b43=C(13);
c1=C(1);c2=C(2); c3=C(3); c4=C(4); 
% 老师的实现
for k=2:n+1
x=x+h;
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

% 我的实现，加了中间变量x,y后的
X2(1)=x0;Y2(1)=y0;
x=x0;y=y0;
for i=1:n
    x=x+h;
    k1=funfcn(x,y);
    k2=funfcn(x+a2*h, y+h*b21*k1);
    k3=funfcn(x+a3*h, y+h*b31*k1 + h*b32*k2);
    k4=funfcn(x+a4*h, y+h*b41*k1 + h*b42*k2 + h*b43*k3);
    X2(i+1)=x;
    Y2(i+1)=y+h*(c1*k1+c2*k2+c3*k3+c4*k4);
    y=Y2(i+1);
end

% 我的实现
X3(1)=x0;Y3(1)=y0;
for i=1:n
    X3(i+1)=X3(i)+h;
    k1=funfcn(X3(i),Y3(i));
    k2=funfcn(X3(i)+a2*h, Y3(i)+h*b21*k1);
    k3=funfcn(X3(i)+a3*h, Y3(i)+h*b31*k1 + h*b32*k2);
    k4=funfcn(X3(i)+a4*h, Y3(i)+h*b41*k1 + h*b42*k2 + h*b43*k3);
    Y3(i+1)=Y3(i)+h*(c1*k1+c2*k2+c3*k3+c4*k4);
end


plot(X,Y,'rp',X,fxy,'bo',X2,Y2,'g*', X3,Y3,'r+'), grid;
xlabel('自变量 X'), ylabel('因变量 Y')
intro_XY='老师的实现，用四阶龙格-库塔方法计算dy/dx=f(x,y)，y(x0)=y0在[x0,b]上的数值解';
intro_fxy='精确解，y/dx=f(x,y)，y(x0)=y0的精确解y=f(x)';
intro_X2Y2='我的实现加了中间变量，用四阶龙格-库塔方法计算dy/dx=f(x,y)，y(x0)=y0在[x0,b]上的数值解';
intro_X3Y3='我的实现，用四阶龙格-库塔方法计算dy/dx=f(x,y)，y(x0)=y0在[x0,b]上的数值解';
legend(intro_XY,intro_fxy,intro_X2Y2,intro_X3Y3)

