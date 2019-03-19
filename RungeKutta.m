function [ x,y ] = RungeKutta( f, x0, xn, y0, h )
%�����Ľ�Runge-Kutta��ʽ
%�ȼ��� [x,y]=CommonRungeKutta(f, x0, xn, y0, h, [1/2 1/2 1], [1/2 0 1/2 0 0 1], [1/6 2/6 2/6 1/6])
%���� fun=����f(x,y),
%     x0=��˵㣬
%     xn=�Ҷ˵㣬x0 <= x <= xn
%     y0=��ֵ��y0=y(x0),
%     h=������
%��� ����x��Ԫ�����Ա���x��ȡֵ��
%     ����y��Ԫ���������Ľ�Runge-Kuttaһ�㹫ʽ�����ֵ����������x��Ԫ�ش�����ֵ��
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

