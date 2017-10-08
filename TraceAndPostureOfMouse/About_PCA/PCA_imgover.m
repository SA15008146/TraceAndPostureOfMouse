the_file='C:\Users\Administrator\Desktop\96361jpg';
files = dir([the_file,'\S','*','1.jpg']);
imgadded = imread([the_file,'\',files(1).name]);
for i= 2:length(files)
   a = imread([the_file,'\',files(i).name]);
    imgadded=(255-imgadded) + (255-a);
end
imshow(imgadded);