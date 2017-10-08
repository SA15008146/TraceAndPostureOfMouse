% the function is used to get the trace of rat ; it's not  efficiency ;
% perhaps vectorization might be usefull ; 

function trace_Pos = TraceExtract_getPos(box_size,file_path)
new_file = [file_path,'\cuted'];
ing_path_list = dir([new_file,'\','*.bmp']);
img_num=length(ing_path_list);
radius = box_size/2;
trace_Pos=zeros(2,img_num);
for i = 1:img_num
img=imread([new_file,'\',num2str(i),'.bmp']);
[Xlim,Ylim]=size(img);
%trace(x,y) = sum(sum(img(x:x+box_size,y:y+box_size)));
[Y,X] = meshgrid(1:Xlim-box_size,1:Ylim-box_size);
trace = arrayfun(@(x,y) sum(sum(img(x:x+box_size,y:y+box_size))),X,Y);

[posX,posY]=find(trace<26*box_size);

trace_Pos(1,i)=(sum(posY)/numel(posY))+radius;
trace_Pos(2,i)=(sum(posX)/numel(posX))+radius;
end

%  figure('name','test')
%  plot(posX,posY,'*r')
%  axis([1 Xlim 1 Ylim])
%  hold on 
%  plot(trace_Pos(1,i),trace_Pos(2,i))
%  hold off