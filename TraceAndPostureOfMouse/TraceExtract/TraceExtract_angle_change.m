
size_angle = numel(motion_angle);
size_speed = numel(speed);
shifting = (size_speed-size_angle)/2;

[val,indx]=find(speed<3);
motion_angle(indx+shifting)=0;
plot(motion_angle);