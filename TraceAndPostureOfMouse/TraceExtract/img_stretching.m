%img_stretching
file_name = 'C:\Users\Administrator\Desktop\forvid\ca_ex';
img_list = dir([file_name,'\*.jpg']);
img_num=size(img_list,1);
for i = 1:img_num
    A=imread([file_name,'\',num2str(i),'.jpg']);
     B=imresize(A,[600 2100]);
     imwrite(B,[file_name,'\',num2str(i),'.jpg']);
end
