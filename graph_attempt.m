
x = linspace(0,100,1000);
a=10;
b=1;
gamma=7000;
rho=1;
scale=(1/2)*rho*((gamma/pi).^2);

y = scale*((b./((x-a).^2+b.^2)-b./((x+a).^2+b.^2)).^2);
dpdx=2*scale*((2.*b.*(x+a))./((x+a).^2+b.^2).^2-(2.*b.*(x-a))./((x-a).^2+b.^2).^2).*(b./((x-a).^2+b.^2)-b./((x+a).^2+b.^2));
plot(x,y)
xlabel('x')
ylabel('P-P_0')
title('Horizontal wall')

figure()
plot(x,dpdx)
xlabel('x')
ylabel('dpdx')
title('Horizontal wall')

figure()
y1 = linspace(0,100,1000);
x1 = scale*((a./((y1+b).^2+a.^2)-a./((y1-b).^2+a.^2)).^2);
dpdy=2*scale*((2.*a.*(y1-b))./((y1-b).^2+a.^2).^2-(2.*a.*(y1+b))./((y1+b).^2+a.^2).^2).*(a./((y1+b).^2+a.^2)-a./((y1-b).^2+a.^2));
plot(x1,y1)
xlabel('P-P_0')
ylabel('y')
title('Vertical wall')

figure()
plot(y1,dpdy)
xlabel('y')
ylabel('dpdy')
title('Vertical wall')

