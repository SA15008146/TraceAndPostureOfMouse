[val_left,indx_left] = find(motion_angle>0);
[val_right,indx_right] = find(motion_angle<0);
numel(indx_left)-numel(indx_right)