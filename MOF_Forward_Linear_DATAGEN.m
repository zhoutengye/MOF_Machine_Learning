clear
clc

fig_option = 1;

slope = linspace(-10,10,1001);
intersecpt = linspace(-10,10,1001);
n1 = length(slope);
n2 = length(intersecpt);

fileID = fopen('MOF_backward.txt','w');
for i = 1:n1
	for j = 1:n2
			a = slope(i);
			b = -1;
			c = intersecpt(j);
			[nn,areas,centroids] = Area_and_Centroid(a,b,c);
			if (areas(1) >0 && areas(2)>0) 
				fprintf(fileID,'%8.6f %8.6f %8.6f %8.6f %8.6f %8.6f\n',[slope(i), intersecpt(j),areas(1),areas(2),centroids(1),centroids(2)]);
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