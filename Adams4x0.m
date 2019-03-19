function [k,X,Y,wucha,P]= Adams4x0(funfcn,x0,b,y0,h)
x=x0; y=y0;p=128; n=fix((b-x0)/h);
if n<5,return,end;
X=zeros(p,1);
Y=zeros(p,length(y)); f=zeros(p,1); 
k=1; X(k)=x; Y(k,:)=y';
for k=2:4
c1=1/6;c2=2/6;c3=2/6;c4=1/6;
a2=1/2; a3=1/2;a4=1;
b21=1/2;
b31=0;b32=1/2;
b41=0;b42=0;b43=1; 
x1=x+a2*h; x2=x+a3*h; x3=x+a4*h;
k1=feval(funfcn,x,y); 
y1=y+b21*h*k1; x=x+h; 
k2=feval(funfcn,x1,y1);
y2=y+b31*h*k1+b32*h*k2; 
k3=feval(funfcn,x2,y2);
y3=y+b41*h*k1+b42*h*k2+b43*h*k3; 
k4=feval(funfcn,x3,y3);
y=y+h*(c1*k1+c2*k2+c3*k3+c4*k4); X(k)=x; Y(k,:)=y;
end
X;Y;f(1:4)=feval(funfcn,X(1:4),Y(1:4));
for k=4:n
f(k)=feval(funfcn,X(k),Y(k));
X(k+1)=X(1)+h*k; 
Y(k+1)=Y(k)+(h/24)*((f(k-3:k))'*[-9 37 -59 55]'); 
f(k+1)= feval(funfcn,X(k+1),Y(k+1));f(k)=f(k+1); k=k+1;
end
for k=2:n+1
wucha(k)=norm(Y(k)-Y(k-1)); k=k+1;
end
X=X(1:n+1); Y=Y(1:n+1,:); n=1:n+1;
wucha=wucha(1:n,:); P=[n',X,Y,wucha']; 