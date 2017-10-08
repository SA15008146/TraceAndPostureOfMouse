function TraceExtract_timeDomain(str1,str2)

threshold1 = 2*std(str1);
threshold2 = 1.047;
[~,indx1]=find(str1>threshold1);
[~,indx2]=find(str2>threshold2);

num_indx1=numel(indx1);
num_indx2=numel(indx2);
num_sum=size(str1,2);
prior_probability = num_indx1*num_indx2/(num_sum^2);
overlap_percent = numel(intersect(indx1,indx2))/num_sum;
figure('name','timeDomain')
h1=plot(indx1,1,'sr');
hold on
h2=plot(indx2,1,'sg');
h3=plot(intersect(indx1,indx2),1,'sy');
legend([h1(1),h2(1),h3(1)],'inspire one','angle',['overlap ', num2str(100*overlap_percent),'%']);
text(1340,1.55,['prior probability: ',num2str(100*prior_probability),'%'])