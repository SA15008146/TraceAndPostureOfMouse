function indx = get_cell(data_left,cellpos,str,dalay)
%   data_left = [30 127 188 285 431 463 503 540 657 732 764 927 ...
%    1030 1410 1578 1617 1950 ]; %s1

%   data_left = [58 212 502 654 732 215 502 538 649 827 858 968 1076 ...
%      1115 1198 1222 1261 1397 1483 1655 1688 1718 1939 1980 ];%s2 part

%   data_left = [32 126 190 280 364 377 431 463 532 542 625 659 737 ...
%     768 931 1012 1161 1223 1414 1581 1622 1954 ]; %s1 part

str_OI = PCA_OI(str);
max_lim=1;
size_str =size(str,1);
score = zeros(1,size_str);
for i = 1:numel(data_left)
    for ii= 1:size_str
        if str_OI(ii,data_left(i)+dalay)~=0
              score(ii)=score(ii)+1;
        end
    end
end
[~,indx]=sort(score);

figure('name','ca_trace')
Xarray = 1:size(str,2);
plot(Xarray(data_left+dalay),1,'*r')
hold on
for i=1:max_lim
    plot(str(indx(end+1-i),:)+10*(i-1))
end
hold off

figure('name','cellpos')
plot(cellpos(1,:),-cellpos(2,:),'og')
hold on
plot(cellpos(1,indx((end+1-max_lim):end)),-cellpos(2,indx((end+1-max_lim):end)),'*r')

indx = indx(end);


