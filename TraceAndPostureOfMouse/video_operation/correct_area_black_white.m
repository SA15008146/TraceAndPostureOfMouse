% correct_area_black_white
function [judgement,end_area,judge_area] =correct_area_black_white(img,mod,checkLine,endArea,wrongArea)
% mod =1;
% img = 255-imread('C:\Users\Administrator\Desktop\new_test\test.jpg');
img_p_up = imcrop(img,checkLine(1,:));%[644 100 0.25 90]
                %judge_area = imcrop(img);
                %up [527.5 19.5 69 238]  %down  [527.5 320.5 69 238]
                %up judge [364.5 45.5 220 216] %down judge [364.5 299.5 220 216]
sum_up = sum(im2double(img_p_up));
img_p_down = imcrop(img,checkLine(2,:));
sum_down = sum(im2double(img_p_down));

if mod == 5
    judgement = sum_down>sum_up ;
else
    judgement = sum_down<sum_up ;
end

if judgement        %down->stand [559.5 15.5 69 249]
    end_area = endArea(2,:);
    judge_area = wrongArea(1,:);
else                %up->stand 
    end_area = endArea(1,:);
    judge_area = wrongArea(2,:);
end