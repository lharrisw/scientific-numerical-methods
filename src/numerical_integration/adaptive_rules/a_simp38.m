function [Q,evals,E] = a_simp38(f,a,b,tol)

    % Adaptive Simpson's Rule Overview
    % 
    % This function implements Simpson's 3/8 rule using adaptive quadrature to
    % numerically compute integrals. The function takes a parent function
    % f, the endpoints, x0 & x3, and the desired tolerance, tol, as inputs.
    % Because equal subintervals are desired to be used, we use the
    % following expression: xi = x0 + i(x3 - x0)/3, where i = 0,1,2,3. This
    % gives us the intermediate x values.
    
% Code Body

fa = f(a);       % function evaluated at left endpoint
fc = f((2*a + b)/3); % function evaluated at intermediate points
fd = f((2*b + a)/3);
fb = f(b); % function evaluated at right endpoint
evals = 4;       % there are already three function evaluations
Q = (fa + 3*fc + 3*fd + fb)*(b-a)/8; % Simpson's 3/8 rule applied once
Q = quadstep(a,b,fa,fb,Q);    

    function q = quadstep(a,b,fa,fb,S1)
        h = b-a;
        e = (5*a+b)/6;
        cc = (2*a+b)/3;
        m = (b+a)/2;
        dd = (2*b+a)/3;
        g = (5*b+a)/6;
        fe = f(e);
        fcc = f(cc);
        fm = f(m);
        fdd = f(dd);
        fg = f(g);
        evals = evals + 3;
        Sl = (fa + 3*fe + 3*fcc + fm)*h/16;
        Sr = (fm + 3*fdd + 3*fg + fb)*h/16;
        S2 = Sl + Sr;
        E = 32*abs(S2 - S1)/31;
        if h*E < tol
            q = (32*S2 - S1)/31;
        else
            q = quadstep(a,m,fa,fm,Sl) + quadstep(m,b,fm,fb,Sr);
        end
        
    end
    
end
