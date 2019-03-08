function [Etot,Ex,Ey,Ez]=plotringofcharge_nonuniform(N)
epsilon=8.854e-12;
x=0;
y=0;
a= 0.5;
Q= 3e-3;
z=linspace(-3,3,N);
z=z';


for k=1:length(z)
    [Etot(k),Ex(k),Ey(k),Ez(k)]=nonuniform_ringofcharge(a,[x;y;z(k)],N);
end

figure
grid on;
hold on;

xlabel('z-axis');
ylabel('E_z, E_y, E_x (V/m)');
title('Electric Fields Along z-axis due to a non-uniform Charge Distribution');

plot(z,Ez);
plot(z,Ey,'o');
plot(z,Ex);

legend('E_z', 'E_y', 'E_x');
end