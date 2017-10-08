function PCA_plotExplained(explained)
sumEx=0;
size = numel(explained);
sumExp=zeros(size,1);
for i=1:size
    sumEx=sumEx+explained(i);
    sumExp(i)=sumEx;
end
bar(explained);
grid on
hold on
plot(sumExp);
xlabel('Component')
xlim([0,40])
ylabel('percent')