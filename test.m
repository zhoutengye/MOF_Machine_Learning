clear
clc

% %% find area and centroid
a = 0.5;
b = -0.5;
c = 0.7;
[nn,area,centroid] = Area_and_Centroid(a,b,c);
fig_option = 1;
MOF_plot(a,b,c,area,centroid,fig_option);

% % tests
% a = [1,1,1,3,3,-1,1,1];
% b = [-1,-3,3,-1,1,1,1,1];
% c = [-0.5,1.5,-1.5,-1.5,-1.5,-0.5,-0.5,-1.5];

% % for i = 1:1:8
% % [nn,area,centroid] = Area_and_Centroid(a(i),b(i),c(i));
% % fig_option = 0;
% % MOF_plot(a(i),b(i),c(i),area,centroid,fig_option);
% % print('-depsc','-r300',['figure\a',num2str(i),'.eps']);
% % end

% for i = 1:1:8
% [nn,area,centroid] = Area_and_Centroid(a(i),b(i),c(i));
% fig_option = 1;
% MOF_plot(a(i),b(i),c(i),area,centroid,fig_option);
% print('-depsc','-r300',['figure\b',num2str(i),'.eps']);
% end
