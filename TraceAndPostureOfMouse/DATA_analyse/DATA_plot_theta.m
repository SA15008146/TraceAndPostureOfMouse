figure('name','data')
plot(2,sin_theta_control(1,:),'*k');
axis([0 5 -30 60])
alpha(0.5)
hold on 
plot(1,sin_theta_all(1,:),'*k');
alpha(0.5)
b = bar([1,2],[mean(sin_theta_all(1,:)),mean(sin_theta_control(1,:))]);
alpha(0.5)
set(gca,'XTick',1:6)
set(gca,'XTickLabel',{'event','random','','',''})