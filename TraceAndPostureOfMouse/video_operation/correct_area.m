% correct_area
function [upORdown,end_area,judge_area] =correct_area(img,mod,checkLine,endArea,wrongArea)
% mod =1;
% img = 255-imread('C:\Users\Administrator\Desktop\new_test\test.jpg');
img_p_up = imcrop(img,checkLine(1,:));%[644 100 0.25 90]
                %judge_area = imcrop(img);
                %up [527.5 19.5 69 238]  %down  [527.5 320.5 69 238]
                %up judge [364.5 45.5 220 216] %down judge [364.5 299.5 220 216]
std_up = std(im2double(img_p_up));
img_p_down = imcrop(img,checkLine(2,:));
std_down = std(im2double(img_p_down));

if mod == 0 || mod == 3
    judgement = std_down<std_up ;
    upORdown = 1;
else
    judgement = std_down>std_up ;
    upORdown = 0;
end

if judgement        %down->stand [559.5 15.5 69 249]
    end_area = endArea(2,:);
    judge_area = wrongArea(1,:);
else                %up->stand 
    end_area = endArea(1,:);
    judge_area = wrongArea(2,:);
end