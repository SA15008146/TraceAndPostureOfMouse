figure('name','cluster_OI')
hold on
 for i= 1:8
     plot(cellpos(1,IDX==i),-cellpos(2,IDX==i),'*')
 end
 hold off