function x = newt_method(f,dfdx,x0,tol)
% Newton's Method
%
% This is an implementation of Newton's method to compute the roots of
% a function. The inputs are the function f, it's first derivative
% dfdx, an initial guess x0, and the number of iterations to be
% performed N. What this code does is it computes the root x1 of the
% tangent line centered at some x0. Then, the code iterates using x1 as
% the new center of expansion and computes the root of the newly formed
% tangent line x2. This iteration continues until the root is found.

x = x0;

while abs(f(x)) > tol
    x = x - f(x)./dfdx(x);
end

end
