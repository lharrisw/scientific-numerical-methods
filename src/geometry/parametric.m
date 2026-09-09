function parametric(x,y,t,varargin)
%   This function plots the parametric curves x = f(t) and y = g(t) as a
%   function of the parameter t. The function animates the plot as t
%   increases. 
% 
%   PARAMETRIC(X,Y,T) plots the curve (x,y) = (f(t),g(t)) for every value t
%   in its domain. The functions x and y must be function handles for the
%   code to work properly.
%
%   Example: Plot the parameterized curve x = t.^2, y = -cos(t) for 
%   -pi/2 <= t <= pi/2.
%   
%   t = linspace(-pi/2,pi/2);
%   x = t.^2;
%   y = -cos(t);
%   parametric(x,y,t);

if (isa(x,'function_handle') == 0)
    error('x must be a function handle.')
end

if isa(y,'function_handle') == 0
    error('y must be a function handle.')
end

if isempty(varargin) == 1
    figure
    for k = t
        xx = x(k);
        yy = y(k);
        p = plot(xx,yy,'b.','markersize',10);
        xlim([min(x(t)) max(x(t))])
        ylim([min(y(t)) max(y(t))])
        hold on
        grid on
        set(gca,'fontsize',18)
        if ishandle(p)
            set(p,'ydata',yy,'xdata',xx);
            xlabel(sprintf('$x(%1.4f)$',k),'interpreter','latex')
            ylabel(sprintf('$y(%1.4f)$',k),'interpreter','latex')
            pause(0.1);
        end
    end    
elseif isempty(varargin) == 0
    tol = varargin{1};
    figure
    for k = t
        xx = x(k);
        yy = y(k);
        p = plot(xx,yy,'b.','markersize',10);
        xlim([min(x(t)) max(x(t))])
        ylim([min(y(t)) max(y(t))])
        hold on
        grid on
        set(gca,'fontsize',18)
        if ishandle(p)
            set(p,'ydata',yy,'xdata',xx);
            xlabel(sprintf('$x(%1.4f)$',k),'interpreter','latex')
            ylabel(sprintf('$y(%1.4f)$',k),'interpreter','latex')
            pause(tol);
        end
    end
end


end
