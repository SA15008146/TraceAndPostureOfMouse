plot(trace_Pos(1,:),trace_Pos(2,:));
hold on
distance = 4;
plot(trace_Pos(1,1:distance:end),trace_Pos(2,1:distance:end),'or')