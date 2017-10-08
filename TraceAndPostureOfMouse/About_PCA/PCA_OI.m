function str_OI = PCA_OI(str)
str_OI=zeros(size(str));
for i = 1: size(str,1)
    theline = str(i,:);
threshold = 1*std(theline);
str_OI(i,theline>1.5*threshold)=str(i,theline>1.5*threshold);
%str_OI(i,theline>1.5*threshold)=1;
end