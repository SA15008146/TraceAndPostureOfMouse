function speed = TraceExtract_speed(trace_Pos)
length =  size(trace_Pos,2);
speed = zeros(1,length-2);
ii=1;
for i = 2:length-2
    speed(ii)=sqrt((trace_Pos(1,i+2)-trace_Pos(1,i-1))^2+(trace_Pos(2,i+1)-trace_Pos(2,i-1))^2);
    ii=ii+1;
end
plot(speed)
