%get_barycenter
%img=255-imread(['C:\Users\Administrator\Desktop\trace_test\',num2str(i),'.jpg']);
%start_area = [36 229 99 99] ;
function [x,y,is_exist] = get_barycenter(img,start_area)
img_p = 255-imcrop(img,start_area);
indx = find(img_p>220);
[y,x]=ind2sub(size(img_p),indx);

if isnan(indx)
    is_exist = 0;
    x = start_area(1);y = start_area(2);
else
    is_exist = numel(indx)>40;
    x = start_area(1)+round(mean(x));y = start_area(2)+round(mean(y));
end