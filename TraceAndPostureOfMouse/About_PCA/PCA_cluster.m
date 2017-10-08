clc;clear;
load('C:\Users\Administrator\Desktop\96361_12202016_s1\96361_12202016_s1_cellpos.mat')
load('C:\Users\Administrator\Desktop\96361_12202016_s1\96361_12202016_s1.mat')
indx2=kmeans(str,8,'Distance','correlation','Replicates',1000,'Start','cluster');
figure('name','cluster')
hold on
 for i= 1:8
     plot(cellpos(1,indx2==i),-cellpos(2,indx2==i),'*')
 end
 hold off