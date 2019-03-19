function [ x,y ] = Euler(f, x0, xn, y0, h)
%向前欧拉方法 
%输入 f=函数f(x,y),
%     x0=左端点,
%     xn=右端点, x0<= x <= xn
%     y0=初值y0=y(x0),
%     h=步长，
%输出 向量x的元素是自变量x的取值，
%     向量y的元素是利用向前欧拉方法公式求出初值问题在向量x的元素处的数值解
x(1)=x0;y(1)=y0;
n=(xn-x0)/h;
for i=1:n
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+h*f(x(i),y(i));
end

