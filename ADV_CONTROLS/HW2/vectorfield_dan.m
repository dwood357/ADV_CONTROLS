y1 = linspace(0,25,50);%% You can change the size of the phase portraits and the vector field density
y2 = linspace(0,20,50);
[x,y] = meshgrid(y1,y2);
u = zeros(size(x));
v = zeros(size(x));
F=@(t,X) [X(1)*X(2)-4*X(1)-2*X(1); -X(1)*X(2)+2*X(2)-X(2)]; % define your system f(x) here
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
quiver(x,y,u,v,'color',[0.3 0.5 0.7]);
hold on
plot(v(1),u(1),'r:',v(1),u(1),'g-.',v(1),u(1),'b','linewidth',1.5);
