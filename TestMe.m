f=@TestF;x0=0;xn=2;y0=0;h=1/15;

%[x1,y1]=CommonRungeKutta(f, x0, xn, y0, h, [1/2 1/2 1], [1/2 0 1/2 0 0 1], [1/6 2/6 2/6 1/6]);
[x1,y1]=RungeKutta( f, x0, xn, y0, h );
[x2,y2]=Adams4x( f, x0, xn, y0, h );
plot(x1,y1,'mp', x2,y2,'bo'); hold on;
fplot(dsolve('Dy=1-(2*x*y)/(1+x^2)','y(0)=0','x'),[x0,xn]);

grid, xlabel('�Ա��� X'), ylabel('����� Y');
str='y('+string(x0)+')='+string(y0)+'��h='+string(h)+'��['+string(x0)+', '+string(xn)+']';
intro_common='����dy/dx=1-(2xy)/(1+x^2)��'+str;
intro_Euler='��ֵ�⣬����RungeKutta��ʽ��'+intro_common;
intro_EulerPro='��ֵ�⣬Adams��ʽ��ʽ��'+intro_common;
intro_Truth='��ȷ��y=(x+1/3x^3)/(1+x^2)��'+intro_common;
legend(intro_Euler,intro_EulerPro,intro_Truth)