img=255-imread(['C:\Users\Administrator\Desktop\trace_test\',num2str(1927),'.jpg']);
start_area = [10 229 99 99] ;
img_p=imcrop(img,start_area);

indx = find(img_p>210);
[y,x]=ind2sub(size(img_p),indx);

imshow(img_p)
hold on
plot(x,y,'or')

figure
imshow(img)
hold on
plot(10+x,229+y,'or')