function [Etot,Ex,Ey,Ez]=lineofcharge(h,rhol,x,y,z,N)

epsilon=8.854e-12;
dz=2*h/N; % Discretize the total line length of 2h into N pieces
zprime=linspace(-h,h,N); % The linspace command creates a vector that ranges

% from -h to h and has N elements with equal spacing
% Use a for loop to "walk" along the line
for k=1:length(zprime)
% Evaluate the expression which is the same for each component of E
    integrand=dz/((x^2+y^2+(z-zprime(k))^2)^(3/2));
    % Evaluate the differential elements for each component of E, which
    % arise from that small part of the line, i.e., dQ at zprime(k).
    dEx(k)=integrand;
    dEy(k)=integrand;
    dEz(k)=(z-zprime(k))*integrand;
end

% Do the "integration" by summing up the differential pieces that result from
% each value of zprime.
Ex=((rhol*x)/(4*pi*epsilon))*sum(dEx);
Ey=((rhol*y)/(4*pi*epsilon))*sum(dEy);
Ez=(rhol/(4*pi*epsilon))*sum(dEz);
Etot=(Ex^2+Ey^2+Ez^2)^0.5;
end

