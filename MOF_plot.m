function MOF_plot(a,b,c,area,centroid,fig_option)

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
  
plot(centroid(1,1),centroid(1,2),'or','markersize',10);
plot(centroid(2,1),centroid(2,2),'ob','markersize',10);

if (fig_option == 1)
    text(centroid(1,1)-20/nn,centroid(1,2)-8/nn,['Centroid: ', '(' num2str(centroid(1,1),'%5.4f') ',' num2str(centroid(1,2),'%5.4f') ')'])
    text(centroid(2,1)-20/nn,centroid(2,2)-8/nn,['Centroid: ','(' num2str(centroid(2,1),'%5.4f') ',' num2str(centroid(2,2),'%5.4f') ')'])
    text(centroid(1,1)-12/nn,centroid(1,2)+8/nn,['Area = ',num2str(area(1),'%5.4f')])
    text(centroid(2,1)-12/nn,centroid(2,2)+8/nn,['Area = ',num2str(area(2),'%5.4f')])
end

xticks([]);
yticks([]);

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
