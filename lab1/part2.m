function [y]= part2(range)
y=0;
x = linspace(range(1), range(2), 100);


for a=1:99
    xmid = (x(a+1)+x(a))/2;
    %the function in this case is y=2x, the integral is x^2
    fxmid = 2*xmid;
    xdiff = x(a+1)-x(a);
    y = y + fxmid*xdiff;
end

disp(y);