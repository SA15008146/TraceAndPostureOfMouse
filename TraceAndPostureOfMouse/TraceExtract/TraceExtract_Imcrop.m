% this function is used to cut the pics so that u can extract the trace
% of rat ;
% pay attention : 
%       if u r using the function first time ,ensure that the
%       (new_file) is a viable path ;
function TraceExtract_Imcrop(file_path)

new_file = [file_path,'\cuted'];
mkdir(new_file);
ing_path_list = dir([file_path,'\','*.jpg']);
img_num=length(ing_path_list);

for i=1:img_num
    img=imread([file_path,'\',ing_path_list(i).name]);
    img=rgb2gray(img);

    img2=imrotate(img,6.5,'bilinear');
    img2=imcrop(img2,[247.5 167.5 803 803]);

    imwrite(img2,[new_file,'\',num2str(i),'.bmp']);
end

% 批量导入图片的方法；
% file_path = 'C:\Users\crf\Desktop\pic_test';
% ing_path_list = dir([file_path,'\','*.jpg']);
% img_num=length(ing_path_list);
% img=zeros(960,1280,img_num);

% for i=1:img_num
%     img(:,:,u)=imread([file_path,'\',ing_path_list(i).name]);%获得当前图片；
% end 