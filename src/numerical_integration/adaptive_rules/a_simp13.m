function [Q,evals,E] = a_simp13(f,a,b,tol)
    
    % Adaptive Simpson's Rule Overview
    % 
    % This function implements Simpson's rule using adaptive quadrature to
    % numerically compute integrals. The function takes a parent function
    % f, the endpoints, a & b, and the desired tolerance, tol, as inputs.
    
% Code Body

fa = f(a);       % the function evaluated at left endpoint
fc = f((a+b)/2); % function evaluated at midpoint of a & b
fb = f(b);       % function evaluated at right endpoint
evals = 3;       % there are already three function evaluations
Q = (fa + 4*fc + fb)*(b-a)/6; % Simpson's rule applied once
Q = quadstep(a,b,fa,fb,Q);    

    function q = quadstep(a,b,fa,fb,S1)
        h = b-a;         % step-size
        d = (3*a + b)/4; % midpoint of a,c
        m = (b + a)/2;   % midpoint of a,b
        e = (3*b + a)/4; % midpoint of c,b
        fd = f(d);
        fm = f(m);
        fe = f(e);
        evals = evals + 2;
        Sleft = (fa + 4*fd + fm)*h/12;
        Sright = (fm + 4*fe + fb)*h/12;
        S2 = Sleft + Sright;
        E = 16*abs(S2 - S1)/15;
        
        if (b-a)*E < tol
            q = (16*S2 - S1)/15;
        else
            q = quadstep(a,m,fa,fm,Sleft) + quadstep(m,b,fm,fb,Sright);
        end
        
    end

end
