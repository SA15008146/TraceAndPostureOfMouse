function [Trace,correct_trial,End_area,Wrong_area_indx,Time] = video_op_copy(file,mod)
%file = 'C:\Users\Administrator\Desktop\trace_test';
filelist = dir([file,'\','*.jpg']);
img_num=length(filelist);
start_time = [];
start_num =1;
startArea = [36 229 99 99];
checkLine = [685.5 159.5 0.25 44;   %UP
             685.5 454.5 0.25 44];  %DOWN

endArea = [544.5 8.5 94 286;        %UP
           547.5 285.5 93 304];     %DOWN

wrongArea = [380.5 48.5 240 222;    %UP
             383.5 315.5 236 253];  %DOWN
%*******************************************************************
% get start point 
for i = start_num:img_num+start_num-1
    img=imread([file,'\',num2str(i),'.jpg']);
    if is_start_f(img,startArea)
    start_time =[start_time,i];
    end
end
start_point=start_time(1);
for i=1:(numel(start_time)-1)
    if start_time(i+1)-start_time(i)>20
       start_point=[start_point,start_time(i+1)];
    end
end

%********************************************************************
% get trace and end point 
num_start_point = numel(start_point);
correct_trial = zeros(1,num_start_point);
Trace{num_start_point}=[];
Wrong_area_indx{num_start_point}=[];
End_area{num_start_point}=[];
end_point = zeros(1,num_start_point);

for i=1:num_start_point
    img=imread([file,'\',num2str(start_point(i)),'.jpg']);
    pic_indx = start_point(i)+1;
    [x,y,is_exist] = get_barycenter(img,startArea);
    Trace{i}=[Trace{i},[x;y]];
    Search_area = [x-35,y-35,70,70];
    
    judge_img = imread([file,'\',num2str(start_point(i)+30),'.jpg']);
    [~,end_area,judge_area] =correct_area(img,mod,checkLine,endArea,wrongArea);
    
    while is_exist
        img=imread([file,'\',num2str(pic_indx),'.jpg']);
        pic_indx = pic_indx+1;
        [x,y,is_exist] = get_barycenter(img,Search_area);
        Trace{i}=[Trace{i},[x;y]];
        Search_area = [x-35,y-35,70,70];
        if ~is_exist
            img=imread([file,'\',num2str(pic_indx),'.jpg']);
            pic_indx = pic_indx+1;
            [x,y,is_exist] = get_barycenter(img,Search_area);
            Trace{i}=[Trace{i},[x;y]];
            Search_area = [x-35,y-35,70,70];
        end
        if is_exist ~=0&&x>end_area(1)&&x<(end_area(1)+end_area(3))&&y>end_area(2)&&y<(end_area(2)+end_area(4))
            is_exist = 0;   %if the rat is in the correct area ,record stoped ;
            correct_trial(i)=1;
        end
    end
    end_point(i)=pic_indx;
    Wrong_area_indx{i}=find(Trace{i}(1,:)>judge_area(1)&Trace{i}(1,:)<...
    (judge_area(1)+judge_area(3))&Trace{i}(2,:)>judge_area(2)&Trace{i}(2,:)<(judge_area(2)+judge_area(4)));
    End_area{i}=end_area;
end
Time=[start_point;end_point];