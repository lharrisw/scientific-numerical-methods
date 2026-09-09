function [x,t] = heuns_method(rhs,t0,tf,h,x0)
    
    t = t0:h:tf;
    x = zeros(size(t));
    x(1) = x0;
    
    for k = 1:length(t)-1
        x(k+1) = x(k) + 0.5*h*(rhs(t(k),x(k)) + rhs(t(k) + h,x(k) + h*rhs(t(k),x(k))));
    end
    
end
