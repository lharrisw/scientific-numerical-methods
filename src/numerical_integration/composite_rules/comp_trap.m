function Q = comp_trap(f,a,b,n)
% TRAP_QUAD This code implements the trapezoid rule for numerical integration. 
%       Q = TRAP_QUAD(f,a,b,n) computes the approximation of the integral
%       of f by the use of the trapezoid rule. The inputs are the function
%       f, the endpoints a and b, and the number of subdivisions. The
%       function uses linear interpolants for numerical integration.
%
%       Limits to the Original Method and Ways to Improve
%
%       As with the code for the midpoint rule, a "for" loop is used, which
%       restricts the number of rectangles to approximate the integral of the
%       target function. Further, there should also be an input for tolerance
%       to determine and compare the effectiveness of the trapezoid rule.
%
%       Updates
%
%       The updated code contains no "for" loops. A comparison was
%       made using y = sin(x), a = 0, b = pi, and N = 10000. For this test run,
%       the updated code was over 150 times faster than the original code.
%
%       Original Code    
%
%       tic
%       x = linspace(a,b,N); % creating domain with constant step-size
% 
%       delta_x = (b-a)/N; % creating step-size
% 
%       y = @(x) f(x); % function in question
% 
%       A = zeros(N); % array for preallocation
% 
%       for n = 1:N-1
%           A(n) = ((y(x(n)) + y(x(n+1)))/2).*delta_x;
%           A = sum(A);
%       end
%       toc


% Updated Code

%tic
x = linspace(a,b,n+1);

h = x(2)-x(1); % creating step-size

y = @(x) f(x); % function in questionS

yy = f(x); % function

yy = (yy(1:end-1) + yy(2:end))/2;

Q = sum(yy.*h); % area of trapezoids summed together
%toc

end
