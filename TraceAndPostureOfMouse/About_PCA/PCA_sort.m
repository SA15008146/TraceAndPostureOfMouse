function [Sorted,indx]=PCA_sort(score,str,cellpos,column)
%根据评分对原始照片进行排序比对；
scorePart=score(:,column);
size_str=size(str,2);
[Sorted,indx]=sort(scorePart,'descend');
STRS_sorted=str(indx,:);
figure('name','Bar_Sorted')
bar(Sorted);
figure('name','Str_Sorted')
PCA_MAP(STRS_sorted(:,1:end));
figure('name','Str_Sorted_1_2')
plotyy(1:size_str,STRS_sorted(1,:),1:size_str,STRS_sorted(2,:))

A=find(Sorted>1.3*std(Sorted));
B=find(Sorted<-1.3*std(Sorted));
figure('name','Ca Trace')
for i=1:numel(A)
    plot((str(indx(A(i)),1:size_str)+15*(i)))
    hold on
end
for i=1:numel(B)
    plot(str(indx(B(i)),1:size_str),'k')
end
figure('name','show_position')
plot(cellpos(1,:),-cellpos(2,:),'or')
hold on
plot(cellpos(1,indx(A)),-cellpos(2,indx(A)),'*g')
plot(cellpos(1,indx(B)),-cellpos(2,indx(B)),'*r')