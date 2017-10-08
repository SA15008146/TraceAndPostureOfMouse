%[posX,posY];
%cos_sin = [cos_theta,sin_theta;-sin_theta,cos_theta];
function [expand_posture,sin_theta]= DATA_rotate(posX,posY,cos_theta,sin_theta,cellname)
size_pos = numel(posX);
points = zeros(2,size_pos);
for i = 1:size_pos
   points(1,i)=posX(i)*cos_theta-posY(i)*sin_theta;
   points(2,i)=posX(i)*sin_theta+posY(i)*cos_theta;
end
% plot(points(1,:),points(2,:),'*r')
% axis([-195 0 0 195]);

posX = fix(points(1,:)); posY= fix(points(2,:));
%*************************************************************
unique_X =unique(fix(posX));
unique_Y =unique(fix(posY));

Xrange = size(unique_X,2);
Yrange = size(unique_Y,2);
XorY = Xrange - Yrange;

%*************************************************************
if (XorY>0)
    posture_line = zeros(3,Xrange);
    posture_line(1,:) = unique_X;
    for ii = 1:Xrange
        indx = find(posX==posture_line(1,ii));
        posture_line(2,ii)=mean(posY(indx));
        posture_line(3,ii)=max(posY(indx))- min(posY(indx));
    end
else
    posture_line = zeros(3,Yrange);
    posture_line(2,:) = unique_Y;
    for ii = 1:Yrange
        indx = find(posY==posture_line(2,ii));
        posture_line(1,ii)=mean(posX(indx));
        posture_line(3,ii)=max(posX(indx))-min(posX(indx));
    end
end
%*************************************************************
[~,widest_point]= max(posture_line(3,:));
expand_posture(1,:) = DATA_vectorExpand(posture_line(1,3:end-3),100);
expand_posture(2,:) = DATA_vectorExpand(posture_line(2,3:end-3),100);
% posture_alls{i} =expand_posture;

if widest_point>size(posture_line,2)/2
    
    indx_vector =[expand_posture(1,50),expand_posture(2,50),0] ...
        - [expand_posture(1,end-20),expand_posture(2,end-20),0];
    
    point_test =[expand_posture(1,end-20),expand_posture(2,end-20)];
    head_mid = [posture_line(1,4),posture_line(2,4),0]...
              - [expand_posture(1,floor(end/2)),expand_posture(2,floor(end/2)),0];
else
    
    indx_vector = [expand_posture(1,20),expand_posture(2,20),0]...
             - [expand_posture(1,50),expand_posture(2,50),0];
    point_test =[expand_posture(1,20),expand_posture(2,20)];
    head_mid = [expand_posture(1,50),expand_posture(2,50),0] ...
             - [posture_line(1,end-4),posture_line(2,end-4),0];
end

    crossab=cross(indx_vector,head_mid);
    sin_theta=crossab(:,3)/(norm(head_mid)*norm(indx_vector));
    sin_theta = 180*asin(sin_theta)/pi;
% Y_vector = [0 -1];
% 
% cos_theta = dot(indx_vector,Y_vector)/(norm(Y_vector)*norm(indx_vector));
%*************************************************************
%@test
 figure('name','test')
 plot(posX,posY,'*r');
 title(['cell',num2str(cellname)])
 hold on
 x =1;y =2;
 plot(posture_line(x,5:end-5),posture_line(y,5:end-5),'*g');
 plot(posture_line(x,widest_point),posture_line(y,widest_point),'*y');
 plot(expand_posture(x,floor(end/2)),expand_posture(y,floor(end/2)),'*k');
 plot(expand_posture(x,4),expand_posture(y,4),'*b');
 plot(expand_posture(x,end-4),expand_posture(y,end-4),'*b');
 plot(point_test(x),point_test(y),'*k')
hold off