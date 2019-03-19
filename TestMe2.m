x0=0;b=2;y0=0;h=1/15;
[k,X,Y,wucha,P]=Adams4x0(@funfcn,x0,b,y0,h);
y=(X+1/3*X.^3)./(1+X.^2);
a2=1/2; a3=1/2; a4=1;
b21=1/2; 
b31=0;b32=1/2;
b41=0;b42=0;b43=1;
c1=1/6;c2=2/6;c3=2/6;c4=1/6;
C=[c1,c2,c3,c4, a2,a3,a4, b21,b31,b32,b41,b42,b43];
[k,X,Y1,fxy,wch,wucha,P]=RK4(@funfcn,@fun,x0,b,C,y0,h);
plot(X,Y,'gh',X,Y1,'mp',X,y,'bo'), 
grid,xlabel('自变量 X'), ylabel('因变量 Y')
legend('用四阶亚当斯显式公式计算dy/dx=1-(2xy)/(1+x^2)，y(0)=0在[0,2]上的数值解','用常用的四阶龙格-库塔公式计算dy/dx=1-(2xy)/(1+x^2)，y(0)=0在[0,2]上的数值解','dy/dx=1-(2xy)/(1+x^2)的精确解y=(x+1/3x^3)/(1+x^2)')
wchY=abs(y-Y); wchY1=abs(y-Y1); m=zeros(1,k);
for n=1:k
    m(1,n)=n-1;
end
[m',X,y,Y,Y1,wchY,wchY1]