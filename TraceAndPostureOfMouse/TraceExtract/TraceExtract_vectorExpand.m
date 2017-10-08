% TraceExtract_vectorExpand ;
% the function is used for expand the vector of rat motion angle ;
% becouse TraceExtract_corrcoef need X and Y having a same size ;
% A means the vector needed to expand;
%
% Finally this function is of no use ......
function motion_angles=TraceExtract_vectorExpand(motion_angle,length)
figure('name','raw_vector')
plot(motion_angle)
size_A=size(motion_angle,2);
motion_angles=zeros(1,length-1);
ii=1;
for i=1:(size_A-1)/(length-1):size_A
    motion_angles(ii)=interp1(motion_angle,i,'PCHIP'); 
    ii=ii+1;
end
figure('name','expanded_vector')
plot(motion_angles)