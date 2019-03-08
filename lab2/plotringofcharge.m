function [Etot,Ex,Ey,Ez]=plotringofcharge(h, N)
epsilon=8.854e-12;
x=0;
y=0;
a= 0.5;
Q= 3e-3;
z=linspace(-3,3,N);
z=z';

%charge density
rhol= Q/(2*pi*a);

for k=1:length(z)
    [Etot(k),Ex(k),Ey(k),Ez(k)]=ringofcharge(a,rhol,[x;y;z(k)],N);
    Eztheo(k) = (z(k)*2*pi*a*rhol)/(4*pi*epsilon*(a^2+(z(k))^2)^1.5);
end

figure
grid on;
hold on;

xlabel('z-axis');
ylabel('E_z (V/m)');
title('Electric Fields Along z-axis');

plot(z,Ez,'ro');
plot(z,Eztheo);


legend('E_{calculated}', 'E_{theory}');
end