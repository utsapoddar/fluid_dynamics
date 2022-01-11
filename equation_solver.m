syms x y
a=3;
b=3;
c=-1;
gamma=2000;

%eqn = a*x^2 + b*x + c == 0;
eqnx= (0.075)*(2*gamma./pi)*((2*b*(x + a))./((x + a).^2 + b.^2).^2 + (2*b*(x - a))./((x - a).^2 + b.^2).^2)*(b./((x - a).^2 + b.^2) - b/((x + a).^2 + b.^2))==-0.0898;
assume (x>=0)
L_x = vpa(solve(eqnx,x))

eqny= (0.075)*(2*gamma./pi)*((2*a*(y + b))./((y + b).^2 + a.^2).^2 + (2*a*(y - b))./((y - b).^2 + a.^2).^2)*(a./((y - b).^2 + a.^2) - a/((y + b).^2 + a.^2))==-0.0898;
assume (y>=0)
L_y = vpa(solve(eqny,y))

fprintf('The point(s) of seperation in the x-axis is/are: %f.\n', min(L_x));
fprintf('The point(s) of seperation in the y-axis is/are: %f.\n', max(L_y));
