%showTrace
for i= 1:length(Trace)
figure;
img = imread([file,'/','88.jpg'],'jpg');
imshow(img)
hold on
plot(Trace{i}(1,:),Trace{i}(2,:),'or');
end