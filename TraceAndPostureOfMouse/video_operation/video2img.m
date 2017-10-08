function video2img(filename,file,cutArea)
%filename='C:\Users\Administrator\Desktop\video_test\test.wmv';
mov = VideoReader(filename);
img_indx =1;

while hasFrame(mov)
 cdata = imrotate(rgb2gray(readFrame(mov)),6.4,'bilinear'); %get img , format:gray
 cdata = imcrop(cdata,cutArea);               % imcrop ,[519.5 85.5 752 615]
 imwrite(cdata,[file,'\',num2str(img_indx),'.jpg'],'jpg')
 img_indx=img_indx+1;
end