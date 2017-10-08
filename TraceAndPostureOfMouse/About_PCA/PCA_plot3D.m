function PCA_plot3D(coeff,column1,column2,column3)
plot3(coeff(:,column1),coeff(:,column2),coeff(:,column3))
xlabel(['PC',num2str(column1)])
ylabel(['PC',num2str(column2)])
zlabel(['PC',num2str(column3)])
rotate3d
