function [Etot,Ex,Ey,Ez]=nonuniform_ringofcharge(a,point, N)

x = point(1);
y = point(2);
z = point(3);
epsilon=8.854e-12;

dphi=(2*pi)/N;

theta=-dphi;


for k=1:N
    theta=theta+dphi;
    rhol=(theta-pi)^2;
    integrand=(dphi*rhol)/(((x-a*cos(theta))^2 + (y-a*sin(theta))^2 +z^2)^(3/2));
    dEx(k)=(x-a*cos(theta))*integrand;
    dEy(k)=(y-a*sin(theta))*integrand;
    dEz(k)=integrand;
end

Ex=((a)/(4*pi*epsilon))*sum(dEx);
Ey=((a)/(4*pi*epsilon))*sum(dEy);
Ez=((a*z)/(4*pi*epsilon))*sum(dEz);
Etot=(Ex^2+Ey^2+Ez^2)^0.5;

end