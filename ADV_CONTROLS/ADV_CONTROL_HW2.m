syms mp lp r Bp Jb Bm g a da dda t dt ddt tau


EQN1 = mp*(lp^2)*dda + mp*r*lp*ddt*cos(a) - mp*r*lp*da*dt*sin(a) - mp*lp*da*sin(a)*lp*da*cos(a)+ mp*lp*da*sin(a)*r*dt- mp*g*lp*sin(a);
        
EQN2 = mp*(r^2)*ddt + mp*(lp^2)*ddt*sin(a)+ mp*(lp^2)*dt*da*cos(a) + mp*r*lp*dda*cos(a)- mp*r*lp*(da^2)*sin(a)+ Jb*ddt - tau + Bm*dt;
       
eqns = [EQN1 EQN2];

S = solve(eqns, [dda ddt], 'ReturnConditions', true);