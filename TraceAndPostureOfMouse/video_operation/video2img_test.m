mov = VideoReader('C:\Users\Administrator\Desktop\New folder\test.wmv');
img_indx =1;

while img_indx<400
 cdata = imrotate(rgb2gray(readFrame(mov)),6.4,'bilinear'); %get img , format:gray
 %cdata = imcrop(cdata,[370.5 94.5 907 568]);               % imcrop
 imwrite(cdata,['C:\Users\Administrator\Desktop\New folder\',num2str(img_indx),'.jpg'],'jpg')
 img_indx=img_indx+1;
end