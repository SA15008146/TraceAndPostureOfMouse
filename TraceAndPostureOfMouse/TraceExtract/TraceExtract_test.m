% this script just for test , of no use ;
figure('name','test')
imshow(img)
size(img)
hold on
plot(trace_Pos(1,:),trace_Pos(2,:),'r')
axis([1 size(img,1) 1 size(img,2)])