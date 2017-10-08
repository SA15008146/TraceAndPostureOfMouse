% also u need to try many times to check the best choice of step_length ;
% i sugest u can try it from 1 , u need to check the line of plot ,ensure
% that it looks not too complex ,becouse u need to fit the line to the PCA
% coeff line ;
function [mod_sin,motion_angle_theta]=TraceExtract_angle(trace_Pos,step_length)
length=size(trace_Pos,2);
mod_sin=zeros(1,floor((length-step_length*2)/step_length));
cos_theta = mod_sin;
motion_angle_theta=cos_theta;
ii=1;
for i=step_length+1:length-step_length
    a=[trace_Pos(1,i)-trace_Pos(1,i-step_length),trace_Pos(2,i)-trace_Pos(2,i-step_length),0];
    b=[trace_Pos(1,i+step_length)-trace_Pos(1,i),trace_Pos(2,i+step_length)-trace_Pos(2,i),0];
    crossab=cross(a,b);
    mod_sin(ii)=crossab(:,3)/(norm(a)*norm(b));
    cos_theta(ii) = dot(a,b)/(norm(a)*norm(b));
    
    if cos_theta(ii)>0
        motion_angle_theta(ii)=asin(mod_sin(ii))*180/pi;
    elseif cos_theta(ii)<0&&mod_sin(ii)>0
        motion_angle_theta(ii)=180-asin(mod_sin(ii))*180/pi;
    else
        motion_angle_theta(ii)=-180-asin(mod_sin(ii))*180/pi;
    end
        ii=ii+1;
end

figure('name','mod_sin')
plot(mod_sin)

figure('name','sin_value')
plot(motion_angle_theta)