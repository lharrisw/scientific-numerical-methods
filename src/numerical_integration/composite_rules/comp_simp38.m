function Q = comp_simp38(f,a,b,n)
% COMP_SIMP38 Composite Simpson's 3/8 rule for numerical integration.
%       Q = COMP_SIMP38(f,a,b,n) computes an approximation of the integral of
%       f, given endpoints a and b, with n subdivisions, which must be a
%       multiple of 3. Simspson's 3/8 rule utilizes cubic interpolants
%       for numerical integration.
%       
%       Warning messages result if the number of subdivisions is not a
%       multiple of 3.
%       
%       Example: approximating the integral of x.^3 on the interval [0,1]
%       with 8 subintervals
%       
%          % Approximate the integral of x.^3 given the data:
%           
%            f = @(x) x.^3;
%            a = 0;
%            b = 1;
%            Q = comp_simp38(f,a,b,n);
%
%       Class support for inputs f,a,b,n:
%
%          function_handle
%          float: double, single

if rem(n,3)~=0
   error('The value n should be a multiple of 3.');
end 

h = (b-a)/n;
x = a:h:b;
y1 = zeros(size(x));
y2 = y1;
y3 = y2;

for j = 1:(n/3)
    y1(j) = 3*f(x(3*j-1));
    y2(j) = 3*f(x(3*j));
end

for k = 1:(n-3)/3
    y3(k) = 2*f(x(3*k+1));
end

Q = (f(a) + f(b) + sum(y1) + sum(y2) + sum(y3))*3*h/8;

end
