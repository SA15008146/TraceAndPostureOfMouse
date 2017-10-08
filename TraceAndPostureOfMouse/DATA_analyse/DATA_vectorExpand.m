% DATA_vectorExpand ; 
% THIS function comes from TraceExtract_vectorExpand,deleted part of plot;

% the function is used for expand the vector ;
% becouse TraceExtract_corrcoef need X and Y having a same size ;
% length means the vector needed to expand;
%
% Finally this function is of no use ......
function expanded_array=DATA_vectorExpand(array,length)
size_A=size(array,2);
expanded_array=zeros(1,length-1);
ii=1;
for i=1:(size_A-1)/(length-1):size_A
    expanded_array(ii)=interp1(array,i,'PCHIP'); 
    ii=ii+1;
end