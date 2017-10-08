lens = 10;
timelim =60;
for i= 1:lens
figure;
img = imread([file,'/','300.jpg'],'jpg');
imshow(img)
hold on
plot(Trace{i}(1,1:timelim*17),Trace{i}(2,1:timelim*17),'or');
end