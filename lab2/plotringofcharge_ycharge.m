function [Etot,Ex,Ey,Ez]=plotringofcharge_ycharge(N)
epsilon=8.854e-12;
x=0;
z=0;
a= 0.5;
Q= 3e-3;
y=linspace(0,2,N);
y=y';

%charge density
rhol= Q/(2*pi*a);

for k=1:length(y)
    [Etot(k),Ex(k),Ey(k),Ez(k)]=ringofcharge(a,rhol,[x;y(k);z],N);
end

figure
grid on;
hold on;

xlabel('y-axis');
ylabel('E_y (V/m)');
title('Electric Fields Along y-axis');

plot(y,Ey,'r');



legend('E_y');
end