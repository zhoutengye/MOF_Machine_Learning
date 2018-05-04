function MOF_plot(n1,n2,c,area,centroid,fig_option)

  a = n1;
  b = n2;
  c = -b*c;

set(gcf,  'Position', [100, 100, 700, 700]);
axes_position=[0.05 0.05 0.9 0.9];
axes('position',axes_position);
  nn = 200;
  x = linspace(0,1,nn+1);
  y = linspace(0,1,nn+1);
  y1 = - ( c + a*x ) / b;
  hold on
  plot(x,y1,'k');
  axis([0,1,0,1]);
  
plot(centroid(1),centroid(2),'or','markersize',10);

if (fig_option == 1)
    text(centroid(1)-20/nn,centroid(2)-8/nn,['Centroid: ', '(' num2str(centroid(1),'%5.4f') ',' num2str(centroid(2),'%5.4f') ')'])
    text(centroid(1)-12/nn,centroid(2)+8/nn,['Area = ',num2str(area,'%5.4f')])
end

xticks([]);
yticks([]);

fx0 = -c/a;
  fx1 = -(c+b)/a;
  f0y = -c/b;
  f1y = -(c+a)/b;

  if (fx0>=0 && fx0<=1 && f1y>=0 && f1y<=1)
    x0 = 1 - 0.5 * (1-fx0);
    y0 = 0.5 * f1y;
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (f0y>=0 && f0y<=1 && f1y>=0 && f1y<=1)
    x0 = 0.5 ;
    y0 = 0.5 * (f0y+f1y);
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (fx0>=0 && fx0<=1 && fx1>=0 && fx1<=1)
    x0 = 0.5 * (fx0+fx1);
    y0 = 0.5;
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (f0y>=0 && f0y<=1 && fx1>=0 && fx1<=1)
    x0 = 0.5 * fx1;
    y0 = 1 - 0.5 * ( 1 - f0y );
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (fx0>=0 && fx0<=1 && f0y>=0 && f0y<=1)
    x0 = 0.5 * fx0;
    y0 = 0.5 * f0y;
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (fx1>=0 && fx1<=1 && f1y>=0 && f1y<=1)
    x0 = 1 - 0.5 * (1-fx1);
    y0 = 1 - 0.5 * (1-f1y);
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  end

hold off
box on

set(gcf,'PaperPositionMode','auto');
set(gcf, 'InvertHardCopy', 'off');


    

%   f = zeros(nn+1);
%   for j = 1:nn+1
%   for i = 1:nn+1
%       if ( (j-1) / nn >= y1(i) )
%           f(j,i) = 1;
%       end
%   end
%   end
% 
%   [X,Y] = meshgrid(x,y);

%   contourf(X,Y,f,1);
