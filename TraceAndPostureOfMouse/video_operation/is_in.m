% is_in
function [num_of_in_right,num_of_in_wrong,rightTimeSum,wrongTimeSum]= is_in(UPorDOWN,Trace,lens,timelim)
        endArea = [565.5 19.5 278 307;
                  588.5 311.5+20 249 322-20];
%         endArea = [728.5 7.5 109 313;
%            732.5 314.5 108 317];
        wrongArea = [582.5 14.5 253 307;
            588.5 311.5+20 249 322-20];
lens = numel(UPorDOWN);
num_of_in_wrong = zeros(lens,1);
num_of_in_right = zeros(lens,1);
rightTimeSum = zeros(lens,1);
wrongTimeSum = zeros(lens,1);
    for i=1:lens
        end_area = [];
        wrong_area= [];
        if ~UPorDOWN(i)
            end_area = endArea(1,:);
            wrong_area = wrongArea(2,:);
        else
            end_area = endArea(2,:);
            wrong_area = wrongArea(1,:);
        end
        lengths = timelim*17;

        for ii=1:lengths
            
            if isIn(Trace{i}(:,ii),end_area)
                rightTimeSum(i) = rightTimeSum(i)+1;
            end
            if isIn(Trace{i}(:,ii),wrong_area)==1
                wrongTimeSum(i) = wrongTimeSum(i)+1;
            end
            
            if isIn(Trace{i}(:,ii),end_area)==1 && isIn(Trace{i}(:,ii+1),end_area)==0
              num_of_in_right(i)=num_of_in_right(i)+1;
            end
            if isIn(Trace{i}(:,ii),wrong_area)==1 && isIn(Trace{i}(:,ii+1),wrong_area)==0
              num_of_in_wrong(i)=num_of_in_wrong(i)+1;
            end
            
        end
    end