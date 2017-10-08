img = 255-imread('F:\0813sterss\23398.jpg');
  img_p=imcrop(img); % down[685.5 454.5 0.25 44] up [685.5 159.5 0.25 44]
 
%   imshow(img);
%   hold on
%   plot(Trace{6}(1,:),Trace{6}(2,:),'or');

% img=255-imread(['C:\Users\Administrator\Desktop\trace_test\',num2str(2380),'.jpg']);
% img_p = imcrop(img,[298.5 256.5 57 42]);
% start_area = [36 229 99 99] ;
% function [x,y,is_exist] = get_barycenter(img,start_area)
% 
% img_p = imcrop(img,start_area);
% indx = find(img_p>210);
% [y,x]=ind2sub(size(img_p),indx);
% imshow(img_p);
%  hold on
% plot(x,y,'or')
% 
% is_exist = numel(indx)>400;
% x = start_area(1)+round(mean(x));y = start_area(2)+round(mean(y));
% 
%  figure
% imshow(img)
% hold on
% plot(x,y,'or')

%  imshow(img)
%  hold on
%   plot(Trace{1,8}(1,:),Trace{1,8}(2,:),'*r');


