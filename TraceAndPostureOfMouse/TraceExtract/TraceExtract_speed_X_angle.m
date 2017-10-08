%TraceExtract_speed_X_angle
figure('name','speedXangle')
shifting  = (numel(speed)-numel(motion_angle_sin))/2 ;
centripetal = motion_angle_sin(1:end).*speed(1+shifting:end-shifting);
plot(centripetal);
centripetal_right = centripetal;
centripetal_right(centripetal_right<0)=0;
figure('name','right')
plot(centripetal_right);
centripetal_left = centripetal;
centripetal_left(centripetal_left>0)=0;
figure('name','left')
plot(-centripetal_left);
