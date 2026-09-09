function weights = newt_cotes_weights(a,b,N)
    
    % Newton-Cotes Weight Determination
    %
    % This code determines the weights for Newton-Cotes methods for any
    % number of nodes N. This also takes in the endpoints a and b as
    % inputs. The number of nodes must be no less than two. Further, having
    % zero as an endpoint provides a poor result from integrating the
    % interpolant, hence the error message for zero being an endpoint. This
    % code also works for any two reasonable endpoints, and as of right
    % now, reasonable means not too big and not too small. 
    
if N < 1
    error('The number of nodes N must at least be 1.')
end

if a == 0
    error('Zero is bad. Pick another endpoint.')
end

A = ones(N,N);
q = ones(N,1);
x = ones(1,N);

for k = 0:N-1
    x = linspace(a,b,N); 
    y = @(x) x.^k;
    q(k+1,:) = quadgk(y,a,b)/(b-a);
    A(k+1,:) = y(x);
end

weights = A\q; 
    
end
