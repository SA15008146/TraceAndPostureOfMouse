% the threshold must to try many times to find the best value ; i guess
% its about 400 but no more than 500;
function trace_Pos = TraceExtract_plot(trace_Pos)
length =size(trace_Pos,2)-1;
dis = zeros(1,length);

for i=3:length
    dis(i)=sqrt((trace_Pos(1,i-1)-trace_Pos(1,i))^2+(trace_Pos(2,i-1)-trace_Pos(2,i))^2);
    if dis(i) > 150
        trace_Pos(1,i)=(trace_Pos(1,i+1)+trace_Pos(1,i-1))/2;
        trace_Pos(2,i)=(trace_Pos(2,i+1)+trace_Pos(2,i-1))/2;
    end
end

 figure('name','trace_plot')
 plot(trace_Pos(1,:),-trace_Pos(2,:));
 axis([1 724 -720,-1])
 hold on 
 plot(trace_Pos(1,1),-trace_Pos(2,1),'or');

% ii=1;
% for i=1:length
%     if trace_Pos(1,i)==trace_Pos(1,i+1)
%         indx_nan(ii) = i+1 ;
%         ii=ii+1;
%     end
% end
% 
% trace_Pos(1,indx_nan)=NaN;
% trace_Pos(2,indx_nan)=NaN;

% for  i=1:size(indx_nan,2)
%     trace_Pos(1,indx_nan(i))=interp1(trace_Pos(1,:),i,'PCHIP'); 
%     trace_Pos(2,indx_nan(i))=interp1(trace_Pos(2,:),i,'PCHIP'); 
% end
