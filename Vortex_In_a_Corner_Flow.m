clear;
clc;

%% KNOWNS

gamma = 2000;                                                               % Vortex strength (-: CW, +: CCW)
X0    = 3;                                                                  % Vortex X coordinate
Y0    = 3;                                                                  % Vortex Y coordinate

%% CALCULATIONS

% Create grid
numX    = 200;                                                              % Number of X points
numY    = 200;                                                              % Number of Y points
X       = linspace(-15,15,numX)';                                           % X-point array
Y       = linspace(-15,15,numY)';                                           % Y-point array
[XX,YY] = meshgrid(X,Y);                                                    % Create the meshgrid

% Solve for velocities
Vx = zeros(numX,numY);                                                      % Initialize X velocity component
Vy = zeros(numX,numY);                                                      % Initialize Y velocity component
V  = zeros(numX,numY);                                                      % Initialize velocity
Vt = zeros(numX,numY);                                                      % Initialize tangential velocity component
r  = zeros(numX,numY);                                                      % Intialize radius
for i = 1:1:numX                                                            % Loop over X points
    for j = 1:1:numY                                                        % Loop over Y points
        x       = XX(i,j);                                                  % X coordinate
        y       = YY(i,j);                                                  % Y coordinate
        dx      = x - X0;                                                   % X distance from vortex
        dy      = y - Y0;                                                   % Y distance from vortex
        r       = sqrt(dx^2 + dy^2);                                        % Distance from vortex
                                                                            % Compute X velocity component
        Vx(i,j) = (-gamma./(2*pi))*((y-Y0)./((x-X0).^2+(y-Y0).^2)-(y-Y0)./((x+X0).^2+(y-Y0).^2)-(y+Y0)./((x-X0).^2+(y+Y0).^2)+(y+Y0)./((x+X0).^2+(y+Y0).^2));
                                                                            % Compute Y velocity component
        Vy(i,j) = (gamma./(2*pi))*((x-X0)./((x-X0).^2+(y-Y0).^2)-(x+X0)./((x+X0).^2+(y-Y0).^2)-(x-X0)./((x-X0).^2+(y+Y0).^2)+(x-X0)./((x+X0).^2+(y+Y0).^2));
        V(i,j) = sqrt(Vx(i,j)^2 + Vy(i,j)^2);                               % Compute velocity
    end
end

%% COMPUTE CIRCULATION

a    = 2;                                                                   % Horizontal axis half-length
b    = 2;                                                                   % Vertical axis half-length
x0   = X0;                                                                   % Ellipse center X coordinate
y0   = Y0;                                                                   % Ellipse center Y coordinate
numT = 500;                                                                 % Number of points along ellipse
[Gamma,xC,yC,VxC,VyC] = COMPUTE_CIRCULATION(a,b,x0,y0,numT,Vx,Vy,XX,YY);    % Call circulation calculation
fprintf('Circulation: %g\n',Gamma);                                         % Display circulation result

%% PLOTTING

% Plot velocity vectors
figure(1);                                                                  % Create figure
cla; hold on; grid off;                                                     % Get ready for plotting
set(gcf,'Color','White');                                                   % Set color to white
set(gca,'FontSize',12);                                                     % Set font size
h1=quiver(X,Y,Vx,Vy,'r','LineWidth',1);                                     % Plot velocity vectors
set(h1,'AutoScale','on', 'AutoScaleFactor', 1000)
plot(xC,yC,'b-','LineWidth',2);                                             % Plot ellipse

xlim([0 15]);                                                               % Set X-limits
ylim([0 15]);                                                               % Set Y-limits
xline(X0)                                                                   % Putting x line through the origin of the vortex
yline(Y0)                                                                   % Putting y line through the origin of the vortex
xlabel('Horizontal wall/m');                                                % Set X-label
ylabel('Vertical wall/m');                                                  % Set Y-label                                                             % Set axes to equal sizes
daspect([1 1 1])                                                            % Set axes to equal sizes
zoom reset;                                                                 % Reset zoom