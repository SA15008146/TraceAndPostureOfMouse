%statistic
boxsize=50;
timelim = 60;
short = 0;
lens = length(Trace)-short;
TraceSum = zeros(2,timelim*17*lens);
for i= 1:lens
figure;
img = imread([file,'/','10.jpg'],'jpg');
imshow(img)
hold on
plot(Trace{i}(1,1:timelim*17),Trace{i}(2,1:timelim*17),'or');
TraceSum(:,(timelim*17*(i-1)+1):timelim*17*i) = Trace{i}(:,1:timelim*17);
end

[num_of_in_right,num_of_in_wrong,rightTimeSum,wrongTimeSum]= is_in(UPorDOWN,Trace,lens,timelim);

figure;
img = imread([file,'/','10.jpg'],'jpg');
imshow(img)
hold on
plot(TraceSum(1,:),TraceSum(2,:),'*r');

figure
bar([num_of_in_right(1:end-short),num_of_in_wrong(1:end-short)]);
axis([0 10 0 10]);
legend('right','wrong');

figure
bar([rightTimeSum(1:end-short),wrongTimeSum(1:end-short)]);
legend('rightTimeSum','wrongTimeSum');

sub = TraceSum*2;
table = zeros(size(img));
for i=1:size(sub,2)
    if(~isnan(sub(1,i)))
        table(sub(1,i),sub(2,i))=1;
    end
end

newtable = zeros(size(img)-boxsize);
for i= 1:size(table,1)-boxsize
    for ii=1:size(table,2)-boxsize
        newtable(i,ii)=sum(sum(table(i:i+boxsize,ii:ii+boxsize)));
    end
end

HeatMap(flip(newtable',1));