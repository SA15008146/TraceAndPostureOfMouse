function trace_Pos = TraceExtract_getPos(box_size,file_path)
                % new_file = file_path; %for test
new_file = [file_path,'\cuted'];
ing_path_list = dir([new_file,'\','*.bmp']);
img_num=length(ing_path_list);
radius = box_size/2;
trace_Pos=zeros(2,img_num);
start_pic = 1;  % the str2double(name of start pic );
                %get the start point 
img=imread([new_file,'\',num2str(start_pic),'.bmp']);
[Xlim,Ylim]=size(img);

trace_start = zeros(Xlim-box_size,Ylim-box_size);
for x=1:Xlim-box_size
    for y=1:Ylim-box_size
        trace_start(x,y) = sum(sum(img(x:x+box_size,y:y+box_size)));
    end
end
[posX,posY]=find(trace_start<min(min(trace_start))+3*box_size);
trace_Pos(1,1)=(sum(posY)/numel(posY))+radius;
trace_Pos(2,1)=(sum(posX)/numel(posX))+radius;
%
range_size = 200;
half_range_size = range_size/2;
for i = 2:img_num
img=255-imread([new_file,'\',num2str(i+start_pic-1),'.bmp']);
x_origin = floor(trace_Pos(2,i-1));
if x_origin-half_range_size<1
    x_range =1:range_size;
elseif x_origin+half_range_size>Xlim-box_size
    x_range = Xlim-range_size:Xlim-box_size;
else
    x_range = x_origin-half_range_size:x_origin+half_range_size;
end

y_origin =floor(trace_Pos(1,i-1));
if y_origin-half_range_size<1
    y_range =1:range_size;
elseif y_origin+half_range_size+box_size>Ylim
    y_range = Ylim-range_size:Ylim-box_size;
else
    y_range = y_origin-half_range_size:y_origin+half_range_size;
end
trace_start = zeros(Xlim-box_size,Ylim-box_size);
for x=x_range
    for y=y_range
        trace_start(x,y) = sum(sum(img(x:x+box_size,y:y+box_size)));
    end
end

[posX,posY]=find(trace_start>max(max(trace_start))-60*box_size);
trace_Pos(1,i)=(sum(posY)/numel(posY))+radius;
trace_Pos(2,i)=(sum(posX)/numel(posX))+radius;

% figure('name','test') % for test
% plot(posX,posY,'*r')
% axis([1 Xlim 1 Ylim])
%  hold on 
%   plot(trace_Pos(1,i),trace_Pos(2,i))
%  hold off
end

