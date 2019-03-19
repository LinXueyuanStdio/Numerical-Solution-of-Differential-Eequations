function [ x,y ] = CommonRungeKutta( f, x0, xn, y0, h, a,b,c )
%四阶Runge-Kutta一般公式
%输入 fun=函数f(x,y),
%     x0=左端点,
%     xn=右端点,
%     y0=初值y0=y(x0),
%     h=步长，
%     a=1x3参数矩阵，
%     b=1x6参数矩阵，
%     c=1x4参数矩阵。这里的参数矩阵指四阶Runge-Kutta一般形式的公式里的参数
%输出 向量x的元素是自变量x的取值，
%     向量y的元素是利用四阶Runge-Kutta一般公式求出初值问题在向量x的元素处的数值解
x(1)=x0;y(1)=y0;
n=(xn-x0)/h;
for i=1:n
    x(i+1)=x(i)+h;
    k1=f(x(i),y(i));
    k2=f(x(i)+a(1)*h, y(i)+h*b(1)*k1);
    k3=f(x(i)+a(2)*h, y(i)+h*(b(2)*k1 + b(3)*k2));
    k4=f(x(i)+a(3)*h, y(i)+h*(b(4)*k1 + b(5)*k2 + b(6)*k3));
    y(i+1)=y(i)+h*[k1 k2 k3 k4]*c';
end


