% get_speed
function [delta_Time,speed]=get_speed(Trace,Time)
lengths = length(Trace);
speed = zeros(1,lengths);
for i = 1:lengths
    Array = Trace{i};
    Array = Array(~isnan(Array));
    Array = reshape(Array,2,numel(Array)/2);
    pre_post = Array(:,2:end)-Array(:,1:end-1);
    speed(i) = sum(arrayfun(@(x) sqrt(pre_post(1,x)^2+pre_post(2,x)^2),1:size(pre_post,2)));
end
delta_Time = (Time(2,:)-Time(1,:));
speed = speed./(delta_Time);