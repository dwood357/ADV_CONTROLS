clear 
mu=1;
alpha=-1;
omega=1;
% F=@(t,X) [X(2);-X(1)+X(1)^3-mu*X(2)]; % define your system f(x) here
% F=@(t,X) [mu*X(1)-2*omega*X(2)+alpha*X(1)*((X(1)^2)/9 + X(2)^2);(omega/3)*X(1)+mu*X(2)+alpha*X(2)*((X(1)^2)/9 + X(2)^2)];
% F=@(t,X) [X(2);0.1*(1-X(2))+0.2*mu*sin(X(1))+0.5*mu^2*sin(2*X(1))];

F=@(t,X) [X(1)*X(2)-4*X(1)-2*X(1); -X(1)*X(2)+2*X(2)-X(2)];

% y1 = linspace(-4,4,50);%% You can change the size of the phase portraits and the vector field density
% y2 = linspace(-4,4,50);
y1 = linspace(0,25,75);%% You can change the size of the phase portraits and the vector field density
y2 = linspace(0,20,75);

[x,y] = meshgrid(y1,y2);
u = zeros(size(x));
v = zeros(size(x));
t=0;
for i = 1:numel(x)
    Yprime = F(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
 for i = 1:numel(x)
 Vmod = sqrt(u(i)^2 + v(i)^2);
 u(i) = u(i)/Vmod;
 v(i) = v(i)/Vmod;
 end
quiver(x,y,u,v,'color',[0.3 0.7 0.5]); 
pbaspect([1 1 1])
figure(gcf)
title('mu=3')
% title('mu=1, alpha = -1, omega = 1')
xlabel('x_1')
ylabel('x_2')
hold on

%% Define an array of the staring points for the trajectorise here
% IP=[ -4.0,0.0;
%     % -4.0,-4.0;
%     %-4.0,4.0;
%     -3.0,-4.0;
%     -3.0,4.0;
%     %-2.0,-4.0;
%     %-2.0,4.0;
%     -1.0,-4.0;
%     -1.0,4.0;
%     %-0.5,-4.0;
%     %-0.5,4.0;
%     -0.1,4.0;
%     -0.1,-4.0;
%    % 0.1,0.0;
%     0.1,4.0;
%     0.1,-4.0;
%    % 0.5,4.0;
%     %0.5,-4.0;
%     1.0,4.0;
%     1.0,-4.0;
%      %2.0,4.0;
%      %2.0,-4.0;
%      3.0,4.0;
%      3.0,-4.0;
%     % 4.0,4.0;
%     % 4.0,-4.0;
%      4.0,0.0;
%     %%%%%%%%%%%%%%%%%%
%      -4.0,3.0;
%      %-4.0,2.0;
%      -4.0,1.0;
%      -4.0,-1.0;
%      %-4.0,-2.0;
%      -4.0,-3.0;
%      4.0,3.0;
%     % 4.0,2.0;
%      4.0,1.0;
%      4.0,-1.0;
%     % 4.0,-2.0;
%      4.0,-3.0;
%     % -2,0;  
%      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      -1.5,-1;
%       1.5,-1;
%       -1.5,1;
%       1.5,1;
%       -0.5,1.5;
%       0.5,-1.5;
%       -0.5,-1.5;
%       0.5,1.5;
%       -1.5,0;
%       1.5,0;
%       
%       0.68,-0.68;
%       -0.68,-0.68;
%       -0.68,0.68;
%       0.68,0.68;
%       0.96,-0.41;
%       0.96,0.41;
%       -0.96,-0.41;
%       -0.96,0.41;
%       -0.41,-0.96;
%       0.41,-0.96;
%       -0.41,0.96;
%       0.41,0.96;
%       0.01,0;
%       -0.01,0;
%       0,-0.01;
%       0,0.01;
%       -10,10;
%       -20,20;
%       -25,25;
%       0,25;
%       -15,15;
%       0,5;
%       0,10;
%       5,5;
%       10,10;
%       20,20;
%      ];  
%  %% End of the array for the starting points of trajectories
%  %% 
IP = [0,0;25,20];
for k = 1:length(IP)
    [ts,ys] = ode45(F,[0,10],IP(k,:));
     plot(ys(:,1),ys(:,2),'b','linewidth',1.5);
     plot(ys(1,1),ys(1,2),'kx','linewidth',1.5); % Mark the Starting point starting point
 
end
% axis([-2,2,-2,2]) %% You can change the axis limts of your phase portrait
% axis([0,25,0,20])
% axis([-6,6,-3,3])
% axis([-10,10,-10,10])
hold off
grid