%the function is used to compare the motion_angle and str or coeff ;
%motion_angle can be motion_angle_left or right also ;

function score_corrcoef2=TraceExtract_corrcoef(motion_angles,str)
motion_angles_length=numel(motion_angles);
str_length=size(str,2);
shifting = (str_length-motion_angles_length)/2;
score_corrcoef=arrayfun(@(x) corrcoef(str(x,(shifting+1):(end-shifting)),motion_angles),1:size(str,1),'UniformOutput',false);
score_corrcoef2=cellfun(@(x) x(2,1),score_corrcoef);
[Sorted,indx]=sort(score_corrcoef2,'descend');
figure('name','sorted_corrcoef_score')
bar(Sorted)
figure('name','positive_correlation_2_motion_angle')
plotyy(1:motion_angles_length,str(indx(1),(shifting+1):(end-shifting)),1:motion_angles_length,motion_angles(1:end))
figure('name','negative_correlation_2_motion_angle')
plotyy(1:motion_angles_length,str(indx(end),(shifting+1):(end-shifting)),1:motion_angles_length,motion_angles(1:end))
TraceExtract_timeDomain(str(indx(1),(shifting+1):(end-shifting)),motion_angles);
TraceExtract_timeDomain(str(indx(end),(shifting+1):(end-shifting)),motion_angles);
