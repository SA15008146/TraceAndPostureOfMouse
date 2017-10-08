A=find(Sorted>50);
indx(A)
figure('name','show_position')
plot(cellpos(1,:),-cellpos(2,:),'or')
hold on
plot(cellpos(1,indx(A)),-cellpos(2,indx(A)),'*g')