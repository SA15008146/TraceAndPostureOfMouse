% target : smooth the trace_Pos
figure('name','raw')
plot(trace_Pos(1,:),-trace_Pos(2,:));
for i =1:5
    x= smooth(x,i);
    y= smooth(y,i);
end
new_trace = [x';y'];
figure('name','smoothed')
plot(new_trace(1,:),-new_trace(2,:))