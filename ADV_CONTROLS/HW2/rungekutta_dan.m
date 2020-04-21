lam = 0.0001;
% lam = 500;
K=-4; %part of equation 13 and 15 below
for m=1:length(IP)
x1(1)=IP(m,1);
x2(1)=IP(m,2);
a=[25/216,0,1408/2565,2197/4101,-1/5,0];
b=[16/135,0,6656/12825,28561/56430,-9/50,2/55];
g=[0,1/4,3/8,12/13,1,1/2];
f=[0,0,0,0,0; 1/4,0,0,0,0; 3/32,9/32,0,0,0; 1932/2197,-7200/2197,7296/2197,0,0;
    -8/27,2,-3544/2565,1859/4104,-11/40];
for k=1:n-1
    s=x1(k)^2 + x2(k)^2 -20*(x1(k)+x2(k))+175; %Surface
   % s=x2(k)-3*cos(0.2*pi*x1(k)); %Surface
    if s>0
       %u = -lam*x1(k)^2;
        u=((2*x1(k)^2)*x2(k) - (8*x1(k)^2) - 2*x1(k)*(x2(k)^2) + 4*(x2(k)^2) + 80*x1(k)-40*x2(k))/(-4*(x1(k)^2)-2*(x2(k)^2)+40*x1(k)+20*x2(k));
       % u=-4*x1(k); %switched control
       % u=-(0.2*x2(k)^2+x1(k)+0.4*pi*(x1(k)+0.4*x2(k)*sin(x1(k)))*sin(0.2*pi*x1(k)))-4*x2(k)^2;
    elseif s<0
        %u = lam*x1(k)^2;
        u=-((2*x1(k)^2)*x2(k) - (8*x1(k)^2) - 2*x1(k)*(x2(k)^2) + 4*(x2(k)^2) + 80*x1(k)-40*x2(k))/(-4*(x1(k)^2)-2*(x2(k)^2)+40*x1(k)+20*x2(k));
        %u=4*x1(k); %switched control
        %u=-(0.2*x2(k)^2+x1(k)+0.4*pi*(x1(k)+0.4*x2(k)*sin(x1(k)))*sin(0.2*pi*x1(k)))+4*x2(k)^2;
    end
    T11=DT*F1(x1(k),x2(k),t(k));
    T12=DT*F2(x1(k),x2(k),u,t(k));
    T21=DT*F1(x1(k)+f(1,1)*T11,x2(k)+f(1,1)*T12,t(k)+g(2)*DT);
    T22=DT*F2(x1(k)+f(1,1)*T11,x2(k)+f(1,1)*T12,u,t(k)+g(2)*DT);
    T31=DT*F1(x1(k)+f(2,1)*T21+f(2,1)*T21,x2(k)+b(2)*T22...
        +(b(3)-b(1))*T21,t(k)+b(3)*DT);
    T32=DT*F2(x1(k)+b(2)*T21+(b(3)-b(1))*T11,x2(k)+b(2)*T22...
        +(b(3)-b(1))*T21,u,t(k)+b(3)*DT);
    T41=DT*F1(x1(k)+b(3)*T31+b(5)*T21+(b(4)-b(5)-b(6))*T11,...
        x2(k)+b(3)*T32+b(5)*T22+(b(4)-b(5)-b(6))*T12,t(k)+b(6)*DT);
    T42=DT*F2(x1(k)+b(3)*T31+b(5)*T21+(b(4)-b(5)-b(6))*T11,...
        x2(k)+b(3)*T32+b(5)*T22+(b(4)-b(5)-b(6))*T12,u,t(k)+b(6)*DT);
    x1(k+1)=x1(k)+(1/6)*(T11+2*T21+2*T31+T41);
    x2(k+1)=x2(k)+(1/6)*(T12+2*T22+2*T32+T42);
end;
plot(x1,x2,'r', 'linewidth',1.5);
plot(x1(1),x2(1),'kx','linewidth',1.5);
axis([0,25,0,20])
% axis([0,50,0,75]);
end;

