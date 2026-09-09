function Q = comp_simp(f,a,b,n)
% COMP_SIMP Composite Simpson's 1/3 rule for numerical integration.
%       Q = COMP_SIMP(f,a,b,n) computes an approximation of the integral of
%       f, given endpoints a and b, with n subdivisions, which must be a
%       multiple of 2. Simspson's 1/3 rule utilizes quadratic interpolants
%       for numerical integration.
%       
%       Warning messages result if the number of subdivisions is not a
%       multiple of 2.
%       
%       Example: approximating the integral of x.^3 on the interval [0,1]
%       with 8 subintervals
%       
%          % Approximate the integral of x.^3 given the data:
%           
%            f = @(x) x.^3;
%            a = 0;
%            b = 1;
%            Q = comp_simp(f,a,b,n);
%
%       Class support for inputs f,a,b,n:
%
%          function_handle
%          float: double, single

    
if rem(n,2) ~= 0
    error('The value for the number of subintervals n should be even.')
end

h = (b-a)/n;
x = a:h:b;
y1 = zeros(size(x));
y2 = y1;

for j = 1:((n/2)-1)
    y1(j) = 2*f(x(2*j+1));
end

for k = 1:(n/2)
    y2(k) = 4*f(x(2*k));
end

Q = h*(f(a) + f(b) + sum(y1) + sum(y2))/3;

end
