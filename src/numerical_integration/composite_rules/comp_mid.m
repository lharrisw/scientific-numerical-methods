function Q = comp_mid(f,a,b,n)
% MID_QUAD This function implements the midpoint rule to compute integrals
% numerically. 
%       A = MID_QUAD(f,a,b,n) computes the approximation of the integral of
%       f by using the midpoint rule. The inputs to the function are the
%       function handle f, the endpoints a and b, and the number of
%       subdivisions n. The function implements quadrature using piecewise
%       constant functions for numerical integration.
%
%       Limits to the Method Below and Ways to Improve
% 
%       The "Original Code" below uses a "for" loop, which restricts the number of
%       subdivisions that can be used to approximate the integral, even
%       though the function is only several lines of code. Improvement can be
%       achieved, I think with the use of more linear algebra to implement
%       the use of matrix multiplication, which is well suited for MATLAB.
%       Other ways to improve this code is to implement an input for
%       tolerance, so as to quantify how accurate the code is and so it can
%       be compared with other quadrature methods.
%
%       Updates
%
%       The code was re-written without using "for" loops. A comparison was
%       made using y = sin(x), a = 0, b = pi, and N = 10000. For this test run,
%       the updated code was over 100 times faster than the original code.
%    
%       Original Code
%
%       tic  
%       x = linspace(a,b,n); % forming the domain of integration 
% 
%       delta_x = (b-a)/n; % creating the step-size
% 
%       y = @(x) f(x); % the function in question
% 
%       Q = zeros(N); % array for size preallocation
% 
%       for n = 1:N-1
%           Q(n) = y((x(n) + x(n+1))/2).*delta_x; % midpoint rule
%           Q = sum(Q); % computing the riemann sum
%       end
%       toc


% Updated Code

%tic
x = linspace(a,b,n+1); % forming domain of integration

h = x(2)-x(1); % step-size

y = @(x) f(x); % defining the function

xx = (x(1:end-1) + x(2:end))/2; % array of midpoints

yy = y(xx); % function evaluated at midpoints

Q = sum(yy.*h); % integral
%toc

end
