%[f, x0, xn, y0, h]=GetValue(@TestF, 0, 1, 0, 0.1);
f=@F;
x0=0;
xn=10;
y0=0;
h=0.5;

[x1,y1]=RungeKutta( f, x0, xn, y0, h );
[x2,y2]=Adams4x( f, x0, xn, y0, h );
y3=(x1.*(x1.^2 - 12))./3;
plot(x1,y1,'ro', x2,y2,'b*', x1,y3);hold on;
%fplot(dsolve('Dy=x^2-4','y(0)=0','x'),[x0,xn]);

grid, xlabel('�Ա��� X'), ylabel('����� Y');
str='y('+string(x0)+')='+string(y0)+'��h='+string(h)+'��['+string(x0)+', '+string(xn)+']';
intro_common='����dy/dx=x^2-4��'+str;
intro_RungeKutta='��ֵ�⣬����RungeKutta��ʽ��'+intro_common;
intro_Adams='��ֵ�⣬Adams��ʽ��ʽ��'+intro_common;
intro_Truth='��ȷ��y=(x(x^2-12))/3��'+intro_common;
legend(intro_RungeKutta,intro_Adams,intro_Truth)