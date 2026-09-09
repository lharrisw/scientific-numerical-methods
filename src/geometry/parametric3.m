function parametric3(x,y,z,t,varargin)
%   This function plots the parametric curve defined by x = f(t), y = g(t),
%   z = h(t) as a function of the parameter t. The function animates the
%   plot as t increases
% 
%   PARAMETRIC(X,Y,Z,T) plots the curve defined by (x,y,z) =
%   (f(t),g(t),h(t)) for all values of t in its domain. The functions x, y,
%   and z must be function handle objects for the code to work properly.
%
%   Example: Plot the parameterized curve x = sqrt(t), y = -log(t), z =
%   t.^2 for 1 <= t <= 5.
%   
%   t = linspace(1,5);
%   x = sqrt(t);
%   y = -log(t);
%   z = t.^2
%   parametric(x,y,t);
%   
%   See also PARAMETRIC

if (isa(x,'function_handle') == 0)
    error('x must be a function handle.')
end

if isa(y,'function_handle') == 0
    error('y must be a function handle.')
end

if isa(z,'function_handle') == 0
    error('z must be a function handle.')
end

if isempty(varargin) == 1
    figure
    for k = t
        xx = x(k);
        yy = y(k);
        zz = z(k);
        p = plot3(xx,yy,zz,'r.','markersize',10);
        hold on
        grid on
        set(gca,'fontsize',18)
        xlim([min(x(t)) max(x(t))])
        ylim([min(y(t)) max(y(t))])
        zlim([min(z(t)) max(z(t))])
%         axis square
        if ishandle(p)
            set(p,'ydata',yy,'xdata',xx);
            xlabel(sprintf('$x(%1.4f)$',k),'interpreter','latex')
            ylabel(sprintf('$y(%1.4f)$',k),'interpreter','latex')
            zlabel(sprintf('$z(%1.4f)$',k),'interpreter','latex')
            pause(0.1);
        end
    end
elseif isempty(varargin) == 0
    tol = varargin{1};
    figure
    for k = t
        xx = x(k);
        yy = y(k);
        zz = z(k);
        p = plot3(xx,yy,zz,'r.','markersize',10);
        hold on
        grid on
        set(gca,'fontsize',18)
        xlim([min(x(t)) max(x(t))])
        ylim([min(y(t)) max(y(t))])
        zlim([min(z(t)) max(z(t))])
%         axis square
        if ishandle(p)
            set(p,'ydata',yy,'xdata',xx);
            xlabel(sprintf('$x(%1.4f)$',k),'interpreter','latex')
            ylabel(sprintf('$y(%1.4f)$',k),'interpreter','latex')
            zlabel(sprintf('$z(%1.4f)$',k),'interpreter','latex')
            pause(tol);
        end
    end
end


end
