function base_conversion
b = input('The desired base is: ');
x = input('The number is: ');
whole = base_whole(b,x);
fraction = base_fraction(b,x);
number = whole + fraction;
fprintf('The number %g in base 10 is %1.10f in base %g.\n',x,number,b)
    function whole_num = base_whole(b,x)
        % this function computes the whole number part of the conversion
        if b <= 1
            error("Are you trying to break me??? Input for b must be greater than 1.")
        end
        if x < 0
            x = abs(fix(x)); % returns the number without the decimals
            xx = x;
            n = 1; % start at n = 1 because the first division takes place below
            while fix(xx/b) > 0
                % calculate number of iterations for x/b = 0
                xx = fix(xx/b);
                n = n + 1;
            end
            % define A in terms of n
            A = zeros(1,n);
            for k = 1:n
                % store the remainder in A iterating over the divisions
                r = rem(x,b);
                x = fix(x/b);
                A(k) = r;
            end
            % since the remainders are stored backwards, we flip A and evaluate
            % the polynomial whose coefficients are A at x = 10 to get a number
            A = flip(A);
            whole_num = -polyval(A,10);
        elseif x >= 0
            x = fix(x); % returns the number without the decimals
            xx = x;
            n = 1; % start at n = 1 because the first division takes place below
            while fix(xx/b) > 0
                % calculate number of iterations for x/b = 0
                xx = fix(xx/b);
                n = n + 1;
            end
            % define A in terms of n
            A = zeros(1,n);
            for k = 1:n
                % store the remainder in A iterating over the divisions
                r = rem(x,b);
                x = fix(x/b);
                A(k) = r;
            end
            % since the remainders are stored backwards, we flip A and evaluate
            % the polynomial whose coefficients are A at x = 10 to get a number
            A = flip(A);
            whole_num = polyval(A,10);
        else
            whole_num = fix(x);
        end
    end
    function frac_num = base_fraction(b,x)
        % this function computes the decimal part of the conversion
        A = zeros(1,40); % let there be an n because expansions may be infinite
        for k = 1:20
            frac = x - fix(x); % obtain fractional component
            x = b*frac; % redifine x as b*fractional component
            r = fix(x); % extract whole number part
            A(k) = r; % store whole number part in A
        end
        frac_num = polyval(A,10)/(10^40); % evaluate polynomial at x = 10 
                                          % divide by 10^n for decimal part
    end
end
