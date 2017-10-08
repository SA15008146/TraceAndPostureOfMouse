function PCA_position(score,str,coeff,cellpos,column)
%it depends on the score to adress the cell of max or min score;
[Xmax,~]=find(score(:,column)==max(score(:,column)));
[Xmin,~]=find(score(:,column)==min(score(:,column)));
size_str=size(str,2);
Xmax
Xmin
figure('name',['max_PC',num2str(column)])
[AX,~,~]= plotyy(1:size_str,str(Xmax,:),1:size_str,coeff(:,column)');
xlabel('Time (0.1s)')
legend('Max Score Of Cell','Component')
set(get(AX(1),'ylabel'),'string','Max Score Of Cell'); 
set(get(AX(2),'ylabel'),'string','Component');

figure('name',['min_PC',num2str(column)])
[AX,~,~]=plotyy(1:size_str,str(Xmin,:),1:size_str,coeff(:,column)');
xlabel('Time (0.1s)')
legend('Min Score Of Cell','Component')
set(get(AX(1),'ylabel'),'string','Min Score Of Cell'); 
set(get(AX(2),'ylabel'),'string','Component');

figure('name',['max_min_PC',num2str(column)])
[AX,~,~]=plotyy(1:size_str,str(Xmin,:),1:size_str,str(Xmax,:));
xlabel('Time (0.1s)')
legend('Max Score Of Cell','Min Score Of Cell')
set(get(AX(1),'ylabel'),'string','Max Score Of Cell'); 
set(get(AX(2),'ylabel'),'string','Min Score Of Cell'); 

PCA_timeDomain(str(Xmin,:),str(Xmax,:));

figure('name','show_position')
plot(cellpos(1,:),-cellpos(2,:),'or')
hold on
plot(cellpos(1,Xmin),-cellpos(2,Xmin),'*r')
plot(cellpos(1,Xmax),-cellpos(2,Xmax),'*g')
end