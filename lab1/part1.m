function [y] = part1(coeffs,x)
y=0;
figure;
hold;

leg= length(coeffs);

strleg = [];

for a=1:leg
    y= y + (coeffs(a)).* x.^(a-1);
    ytemp= (coeffs(a)).* x.^(a-1);
    strleg  = [strleg; strcat('Term ', num2str(a))]
    plot(x,ytemp);
end

grid on;

strleg = [strleg; 'y(x) ']
plot(x,y, 'b--');
legend(strleg);
title("Plot of Polynomial of order " + (length(coeffs)-1) );

end

