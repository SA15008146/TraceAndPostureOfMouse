function PCA_plot3D_gif(coeff,column1,column2,column3)
plot3(coeff(1:1001,column1),coeff(1:1001,column2),coeff(1:1001,column3))
xlabel(['PC',num2str(column1)])
ylabel(['PC',num2str(column2)])
zlabel(['PC',num2str(column3)])
axis vis3d
for i=1:36
camorbit(10,0,'data') %data也可以替换成camera,效果不同
M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
if i==1 
   imwrite(nn,cm,'out.gif','gif','LoopCount',inf,'DelayTime',0.1);
else
   imwrite(nn,cm,'out.gif','gif','WriteMode','append','DelayTime',0.1);
end 
end
