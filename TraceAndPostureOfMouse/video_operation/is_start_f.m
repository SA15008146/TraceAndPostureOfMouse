% start_check
% img = imread('C:\Users\Administrator\Desktop\video_test\1923.jpg');
% startArea = [36 229 99 99] ; startArea = 
function  is_start = is_start_f(img,startArea)
img_start = 255-imcrop(img,startArea);  %rat radius 55 pix
%   imshow(img_start)
%   find(img_start>195);  % get the pos of rat
is_start = numel(find(img_start>195))>400; % 1 means start ,0 means nothing ;
% @test
% [raw,col]=ind2sub(size(img_start),indx);
% figure
% plot(col,-raw,'r*')