function [motion_angle_left,motion_angle_right]=TraceExtract_angleRL(motion_angle)
motion_angle(isnan(motion_angle))=0;
motion_angle_left = motion_angle ;
motion_angle_left(motion_angle_left<0)=0;
figure('name','motion_angle_left')
plot(motion_angle_left)

motion_angle_right = motion_angle ;
motion_angle_right(motion_angle_left>0)=0;
motion_angle_right=-motion_angle_right;
figure('name','motion_angle_right')
plot(motion_angle_right)