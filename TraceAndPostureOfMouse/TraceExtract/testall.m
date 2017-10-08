left_speed = motion_angle_left.*speed(4:end-3);
figure('name','left_speed')
plot(left_speed);
right_speed = motion_angle_right.*speed(4:end-3);
figure('name','right_speed')
plot(right_speed);