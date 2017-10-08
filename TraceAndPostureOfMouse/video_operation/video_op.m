function [Trace,UPorDOWN,Time] = video_op(file,mod)
filelist = dir([file,'\','*.jpg']);
shifting = 40 ;
boxsize = 25;
%*******************************************************************
% param
startArea = [221.5+shifting 242.5 151 151];
checkLine = [871.5 224.5 0.25 50;
             871.5 542.5 0.25 50];
endArea = [728.5 7.5 109 313;
           732.5 314.5 108 317];
wrongArea = [582.5 14.5 253 307;
             588.5 311.5 249 322];
img_num=length(filelist);
start_time = [];
end_time = [];
start_num =1;
is_start = 0;
is_record = 0;
searchArea = startArea;
Trace{100}=[];    %default size is 5;
record_indx =1;
UPorDOWN=[];
counter = 0;
%*******************************************************************
% get start point 
for i = start_num:img_num+start_num-1
    img=imread([file,'\',num2str(i),'.jpg']);
    if is_start==0
        is_start = is_start_f(img,startArea);
        if is_start==1
            start_time =[start_time,i];
            searchArea = startArea;
        end
    else 
        [x,y,is_exist] = get_barycenter(img,searchArea);
        Trace{record_indx} = [Trace{record_indx},[x;y]];
        if ~isnan(x)
             searchArea = [x-boxsize,y-boxsize,2*boxsize,2*boxsize];
        end
        
        if is_exist==0
            counter = counter+1;
            if counter>=6
                counter = 0;
                is_start =0;
                if mod ==5 ||mod==6
                    [UPorDOWN(record_indx),~,~] = correct_area_black_white(img,mod,checkLine,endArea,wrongArea);
                else
                    [UPorDOWN(record_indx),~,~] = correct_area(img,mod,checkLine,endArea,wrongArea);
                end
                record_indx = record_indx+1;
                end_time = [end_time,i];
            end
        end
    end 
end
 Time = [start_time;end_time];
 len = numel(end_time);
 deleteEle = [];
 for i = 1:len
    if  end_time(i)-start_time(i)<60*17
       deleteEle = [deleteEle;i];
    end
 end
 Trace(cellfun(@isempty,Trace))=[];
 Trace(deleteEle)=[];
 Time(:,deleteEle)=[];
 UPorDOWN(deleteEle) = [];
%********************************************************************
% get trace and end point 

% num_start_point = numel(start_point);
% correct_trial = zeros(1,num_start_point);
% Trace{num_start_point}=[];
% Wrong_area_indx{num_start_point}=[];
% End_area{num_start_point}=[];
% end_point = zeros(1,num_start_point);
% 
% for i=1:num_start_point
%     img=imread([file,'\',num2str(start_point(i)),'.jpg']);
%     pic_indx = start_point(i)+1;
%     [x,y,is_exist] = get_barycenter(img,[36 229 99 99]);
%     Trace{i}=[Trace{i},[x;y]];
%     Search_area = [x-35,y-35,70,70];
%     
%     judge_img = imread([file,'\',num2str(start_point(i)+30),'.jpg']);
%     [end_area,judge_area] =correct_area(judge_img,mod);
%     
%     while is_exist
%         img=imread([file,'\',num2str(pic_indx),'.jpg']);
%         pic_indx = pic_indx+1;
%         [x,y,is_exist] = get_barycenter(img,Search_area);
%         Trace{i}=[Trace{i},[x;y]];
%         Search_area = [x-35,y-35,70,70];
%         if ~is_exist
%             img=imread([file,'\',num2str(pic_indx),'.jpg']);
%             pic_indx = pic_indx+1;
%             [x,y,is_exist] = get_barycenter(img,Search_area);
%             Trace{i}=[Trace{i},[x;y]];
%             Search_area = [x-35,y-35,70,70];
%         end
%         if is_exist ~=0&&x>end_area(1)&&x<(end_area(1)+end_area(3))&&y>end_area(2)&&y<(end_area(2)+end_area(4))
%             is_exist = 0;   %if the rat is in the correct area ,record stoped ;
%             correct_trial(i)=1;
%         end
%     end
%     end_point(i)=pic_indx;
%     Wrong_area_indx{i}=find(Trace{i}(1,:)>judge_area(1)&Trace{i}(1,:)<...
%     (judge_area(1)+judge_area(3))&Trace{i}(2,:)>judge_area(2)&Trace{i}(2,:)<(judge_area(2)+judge_area(4)));
%     End_area{i}=end_area;
% end
% Time=[start_point;end_point];