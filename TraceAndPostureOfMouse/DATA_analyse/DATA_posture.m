function DATA_posture(file_path)
% file_path = 'C:\Users\Administrator\Desktop\new_img_96361_12202016_s2';
new_file =[file_path,'\material'];
mkdir(new_file);
ing_path_list = dir([file_path,'\','*.bmp']);
img_num=length(ing_path_list);
box_size = 190;
cent_Pos=zeros(2,img_num);
for i = 1:img_num
img=imread([file_path,'\',ing_path_list(i).name]);
[Xlim,Ylim]=size(img);
trace = zeros(Xlim-box_size,Ylim-box_size);
for x=1:Xlim-box_size
    for y=1:Ylim-box_size
        trace(x,y) = sum(sum(img(x:x+box_size,y:y+box_size)));
    end
end
[posX,posY]=find(trace==min(min(trace)));
cent_Pos(1,i)=(sum(posY)/numel(posY));
cent_Pos(2,i)=(sum(posX)/numel(posX));

    img=imcrop(img,[cent_Pos(1,i) cent_Pos(2,i) box_size box_size]);
    imwrite(img,[new_file,'\',num2str(i),'.bmp']);
end