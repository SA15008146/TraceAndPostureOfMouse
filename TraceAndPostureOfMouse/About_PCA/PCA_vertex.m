function indx=PCA_vertex(test_line)
dx=arrayfun(@(x) (test_line(x)-test_line(x-1)),2:numel(test_line));
vertexes=zeros(size(dx));
for i=1:(numel(dx)-1)
    if dx(i)>0&&dx(i+1)<0
        vertexes(i)=1;
    end
end

threshold = 2*std(test_line);
[~,indx1]=find(test_line>threshold);
[~,indx2]=find(vertexes==1);
indx=intersect(indx1,indx2)+1;
xline=1:numel(test_line);
plot(test_line);
hold on
plot(xline(indx),test_line(indx),'*r');