function [ x,y ] = CommonRungeKutta( f, x0, xn, y0, h, a,b,c )
%�Ľ�Runge-Kuttaһ�㹫ʽ
%���� fun=����f(x,y),
%     x0=��˵�,
%     xn=�Ҷ˵�,
%     y0=��ֵy0=y(x0),
%     h=������
%     a=1x3��������
%     b=1x6��������
%     c=1x4������������Ĳ�������ָ�Ľ�Runge-Kuttaһ����ʽ�Ĺ�ʽ��Ĳ���
%��� ����x��Ԫ�����Ա���x��ȡֵ��
%     ����y��Ԫ���������Ľ�Runge-Kuttaһ�㹫ʽ�����ֵ����������x��Ԫ�ش�����ֵ��
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


