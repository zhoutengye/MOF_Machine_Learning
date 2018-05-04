clear
clc

fig_option = 1;

dd = 0.001;

norm1 = linspace(-1+dd,1-dd,1/dd-1);
norm2 = sqrt(1-norm1.^2);
norm1 = [norm1,norm1];
norm2 = [norm2,-norm2];
intersecpt  = linspace(-10,10,1001);
m1 = length(norm1);
m2 = length(intersecpt);
kk = 0;

fileID = fopen('MOF_backward.dat','w');

for i = 1:m1
	for j = 1:m2
		
			n1 = norm1(i);
			n2 = norm2(i);
			c = intersecpt(j);
			[nn,area,centroid] = Area_and_Centroid(n1,n2,c);
			if (area>0 ) 
				kk = kk+1;
				fprintf(fileID,'%8.6f %8.6f %8.6f %8.6f %8.6f %8.6f\n',[norm1(i), norm2(i), intersecpt(j),area,centroid(1),centroid(2)]);
% 			    clf;
% 			    MOF_plot(n1,n2,c,area,centroid,fig_option);
% 			    saveas(gcf,['figure/',num2str(kk),'.png'])
			end
	end
end

fclose(fileID);

		
		%  MOF_plot(a,b,c,area,centroid,fig_option);

%% tests
% a = [1,1,1,3,3,-1,1,1];
% b = [-1,-3,3,-1,1,1,1,1];
% c = [-0.5,1.5,-1.5,-1.5,-1.5,-0.5,-0.5,-1.5];
% 
% for i = 1:1:8
% [nn,area,centroid] = Area_and_Centroid(a(i),b(i),c(i));
% fig_option = 0;
% MOF_plot(a(i),b(i),c(i),area,centroid,fig_option);
% print('-depsc','-r300',['figure\a',num2str(i),'.eps']);
% end
% 
% for i = 1:1:8
% [nn,area,centroid] = Area_and_Centroid(a(i),b(i),c(i));
% fig_option = 1;
% MOF_plot(a(i),b(i),c(i),area,centroid,fig_option);
% print('-depsc','-r300',['figure\b',num2str(i),'.eps']);
% end