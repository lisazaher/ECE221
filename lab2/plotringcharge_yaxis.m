N=500;
x=0;
y=linspace(-3,3,500);
y = y';
z=0;
epsilon=8.854e-12;
a=0.5;
pl=0.003/(2*pi*a);

for k=1:length(y)
    [Etot(k),Ex(k),Ey(k),Ez(k)]=ringofcharge(a,pl,[0;y(k);0],N);
end

figure
grid on;
hold on;

xlabel('y-axis');
ylabel('E_x, E_y, E_z (V/m)');
title('Electric Fields Along y-axis');

plot(y,Ex);
plot(y,Ey,'--');
plot(y,Ez,'r');

legend('E_x', 'E_y', 'E_z');
end