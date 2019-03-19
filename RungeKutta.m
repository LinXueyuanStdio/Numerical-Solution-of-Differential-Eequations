function [ x,y ] = RungeKutta( f, x0, xn, y0, h )
%常用四阶Runge-Kutta公式
%等价于 [x,y]=CommonRungeKutta(f, x0, xn, y0, h, [1/2 1/2 1], [1/2 0 1/2 0 0 1], [1/6 2/6 2/6 1/6])
%输入 fun=函数f(x,y),
%     x0=左端点，
%     xn=右端点，x0 <= x <= xn
%     y0=初值，y0=y(x0),
%     h=步长，
%输出 向量x的元素是自变量x的取值，
%     向量y的元素是利用四阶Runge-Kutta一般公式求出初值问题在向量x的元素处的数值解
x(1)=x0;y(1)=y0;
n=fix((xn-x0)/h);
for i=1:n
    k1=f(x(i),y(i));
    k2=f(x(i)+h/2,y(i)+h*k1/2);
    k3=f(x(i)+h/2,y(i)+h*k2/2);
    k4=f(x(i)+h,y(i)+h*k3);
    y(i+1)=y(i)+(h/6)*(k1+2*k2+2*k3+k4);
    x(i+1)=x(i)+h;
end

