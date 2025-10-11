function t = eq2latex(f,copyOpt)

narginchk(0,2);

if nargin==0
    % for test
    syms a b x g y X0 Y0
    f = (g/(2*pi))*((x-X0)./((x-X0).^2+(y-Y0).^2)-(x+X0)./((x+X0).^2+(y-Y0).^2)-(x-X0)./((x-X0).^2+(y+Y0).^2)+(x-X0)./((x+X0).^2+(y+Y0).^2));
end

if nargin>0
    if ~isa(f,'sym'), error('Invalid type of input expression'); end
end

figure, axis off, axis([-1 1 -1 1])
t = text(0,0,['$' latex(f) '$'],'fontsize',32,'Interpreter','latex');
width = t.Extent(3);
t.Position(1) = -width/2;

if nargin==2
    clipboard(copyOpt,t.String);
end


return
