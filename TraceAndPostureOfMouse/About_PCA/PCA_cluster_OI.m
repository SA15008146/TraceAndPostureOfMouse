str_OI = PCA_OI(str);
indx=kmeans(str_OI,8,'Distance','correlation','Replicates',5000,'Start','uniform');
figure('name','cluster_OI')
hold on
 for i= 1:8
     plot(cellpos(1,indx==i),-cellpos(2,indx==i),'*')
 end
 hold off