mod =2;
file = 'F:\0813sterss';
playback_speed = 16.1; %pic/s ;
shifting = 40 ;
timelim=60;
cutArea = [367.5-shifting 52.5 891+shifting 625];
%*************************************************************
filename = dir([file,'\*.wmv']);
if ~isempty(filename)&&~exist([file,'\','1.jpg'],'file');
    filename = [file,'\',filename(1).name];
    video2img(filename,file,cutArea)
end

if mod ~=2&&mod ~=5
    [Trace,correct_trial,End_area,Wrong_area_indx,Time] = video_op_copy(file,mod);
    save([file,'\','0A_result.mat'],'Trace','correct_trial','End_area','Wrong_area_indx','Time');
else
    [Trace,UPorDOWN,Time] = video_op(file,mod);
    save([file,'\','0A_result.mat'],'Trace','UPorDOWN','Time');

%*************************************************************
% analyze data
lens = numel(UPorDOWN);
[~,speed]=get_speed(Trace,Time);
plot(speed,'or');
[num_of_in_right,num_of_in_wrong,rightTimeSum,wrongTimeSum]= is_in(UPorDOWN,Trace,lens,timelim);
save([file,'\','0B_result.mat'],'num_of_in_right','num_of_in_wrong','speed','file');
end
%*************************************************************
% [delta_Time,speed]=get_speed(Trace,Time);
% save([file,'\','B_result.mat'],'delta_Time','speed');