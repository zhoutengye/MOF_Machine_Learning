function MOF_plot(n1,n2,c,area,centroid,fig_option)

  a = n1;
  b = n2;
  % c = -b*c;
  c = -c*sqrt(n1*n1+n2*n2);

  set(gcf,  'Position', [100, 100, 700, 700]);
axes_position=[0.05 0.05 0.9 0.9];
axes('position',axes_position);
  nn = 200;
  x = linspace(-0.5,0.5,nn+1);
  y = linspace(-0.5,0.5,nn+1);
  y1 = - ( c + a*x ) / b;
  hold on
  plot(x,y1,'k');
  axis([-0.5,0.5,-0.5,0.5]);
  
plot(centroid(1),centroid(2),'or','markersize',10);

if (fig_option == 1)
    text(centroid(1)-20/nn,centroid(2)-8/nn,['Centroid: ', '(' num2str(centroid(1),'%5.4f') ',' num2str(centroid(2),'%5.4f') ')'])
    text(centroid(1)-12/nn,centroid(2)+8/nn,['Area = ',num2str(area,'%5.4f')])
end

xticks([]);
yticks([]);

  fx0 = (0.5*b-c)/a;
  fx1 = -(c+0.5*b)/a;
  f0y = (0.5*a-c)/b;
  f1y = -(c+0.5*a)/b;

  if (fx0>=-0.5 && fx0<=0.5 && f1y>=-0.5 && f1y<=0.5)
    x0 = 0.5 - 0.5 * (0.5-fx0);
    y0 = 0.5 * (f1y+0.5)-0.5;
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (f0y>=-0.5 && f0y<=0.5 && f1y>=-0.5 && f1y<=0.5)
    x0 = 0.0 ;
    y0 = 0.5 * (f0y+f1y);
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (fx0>=-0.5 && fx0<=0.5 && fx1>=-0.5 && fx1<=0.5)
    x0 = 0.5 * (fx0+fx1);
    y0 = 0.0;
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (f0y>=-0.5 && f0y<=0.5 && fx1>=-0.5 && fx1<=0.5)
    x0 = 0.5 * (fx1+0.5) - 0.5;
    y0 = 0.5 - 0.5 * ( 0.5 - f0y );
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (fx0>=-0.5 && fx0<=0.5 && f0y>=-0.5 && f0y<=0.5)
    x0 = 0.5 * (fx0+0.5)-0.5;
    y0 = 0.5 * (f0y+0.5)-0.5;
    q=quiver(x0,y0,n1/20,n2/20);
    q.MaxHeadSize = 30;
  elseif (fx1>=-0.5 && fx1<=0.5 && f1y>=-0.5 && f1y<=0.5)
    x0 = 0.5 - 0.5 * (0.5-fx1);
    y0 = 0.5 - 0.5 * (0.5-f1y);
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
