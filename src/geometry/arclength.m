%% Arc Length Function
function L = arclength(dfdx,a,b)
%   This function calculates the arc length of any function y = f(x) for
%   a <= x <= b. As long as the function is continuous and smooth, meaning
%   a small  change in x produces a small change in f'(x).

L = integral(@(x)sqrt(1+(dfdx(x)).^2),a,b);
