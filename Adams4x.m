function [ x,y ] = Adams4x( F, x0, xn, y0, h )
%四阶Adams显式公式
%输入 fun=函数f(x,y),
%     x0=左端点,
%     xn=右端点,x0 <= x <= xn
%     y0=初值y0=y(x0),
%     h=步长，
%输出 向量x的元素是自变量x的取值，
%     向量y的元素是利用四阶Adams显式公式求出初值问题在向量x的元素处的数值解
n=fix((xn-x0)/h);
if n<5, return, end; % 四阶Adams显式公式需要用到前面4个点的值，n不能小于5
% 先用常用四阶RungeKutta法算出4个点，为四阶Adams显式公式提供4个值
x3=x0+3*h; % 取x0,x1,x2,x3四个点
[x(1:4),y(1:4)]=RungeKutta( F, x0, x3, y0, h ); % x0,x1,x2,x3四个点处的值用RungeKutta法算出来
f(1:4)=F(x(1:4),y(1:4));
% 下面正式开始用四阶Adams显式公式计算后面的值
for i=4:n
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+(h/24)*(f(i-3:i)*[-9 37 -59 55]');
    f(i+1)=F(x(i+1),y(i+1));
end