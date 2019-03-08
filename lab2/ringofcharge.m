function [Etot,Ex,Ey,Ez]=ringofcharge(a,rhol,point, N)
%along the z axis
epsilon=8.854e-12;

dtheta = 2*pi/N;
dphi=linspace(0,2*pi,N); % The linspace command creates a vector that ranges
x = point(1)
y = point(2)
z = point(3)

% Use a for loop to "walk" along the line
for k=1:length(dphi)
% Evaluate the expression which is the same for each component of E
    integrand=dtheta/(((x-a*cos(dphi(k)))^2+(y-a*sin(dphi(k)))^2+z^2)^(3/2));
% Evaluate the differential elements for each component of E, which
% arise from that small part of the line, i.e., dQ at zprime(k).
    dEx(k)=(x-a*cos(dphi(k)))*integrand;
    dEy(k)=(y-a*sin(dphi(k)))*integrand;
    dEz(k)=z*integrand;
end
% Do the "integration" by summing up the differential pieces that result from
% each value of zprime.
constant = (rhol*a)/(4*pi*epsilon);
Ex=constant*sum(dEx);
Ey=constant*sum(dEy);
Ez=constant*sum(dEz);
Etot=(Ex^2+Ey^2+Ez^2)^0.5;

end