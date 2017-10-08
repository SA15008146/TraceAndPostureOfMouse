function [posture_all,sin_theta_all] = DATA_getCurve(file_path)
%file_path = 'C:\Users\Administrator\Desktop\New folder';
box_size = 28;
ing_path_list = dir([file_path,'\','*.bmp']);
img_num=length(ing_path_list);
expand_posture =zeros(2,100);
posture_all = cell(1,img_num);
sin_theta_all=zeros(2,img_num);
for i =  1:img_num
img=256 - imread([file_path,'\',ing_path_list(i).name]);
[name,~]=strtok(ing_path_list(i).name,'.');
sin_theta_all(2,i) = str2double(name) ;
[Xlim,Ylim]=size(img);
trace = zeros(Xlim-box_size,Ylim-box_size);
for x=1:Xlim-box_size
    for y=1:Ylim-box_size
        trace(x,y) = sum(sum(img(x:x+box_size,y:y+box_size)));
    end
end
[posX,posY]=find(trace>(max(max(trace))-60*box_size));

unique_X =unique(posX)';
unique_Y =unique(posY)';

Xrange = size(unique(posX),1);
Yrange = size(unique(posY),1);
XorY = Xrange - Yrange ;

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
%posture_all{i} =expand_posture;
indx_vector = [posture_line(1,widest_point(1)),posture_line(2,widest_point(1))]...
             - [expand_posture(1,50),expand_posture(2,50)];

Y_vector = [0 -1];

cos_theta = dot(indx_vector,Y_vector)/(norm(Y_vector)*norm(indx_vector));
sin_theta = sqrt(1-cos_theta^2);

[posture_all{i},sin_theta_all(1,i)]= DATA_rotate(posX,posY,cos_theta,sin_theta,sin_theta_all(2,i));

%*************************************************************
%@test
%  figure('name','test2')
%  plot(posX,posY,'*r');
%  axis([0 195 0 195]);
%  hold on
%  x =1;y =2;
%  plot(posture_line(x,5:end-5),posture_line(y,5:end-5),'*g');
%  plot(posture_line(x,widest_point),posture_line(y,widest_point),'*y');
%  plot(expand_posture(x,floor(end/2)),expand_posture(y,floor(end/2)),'*b');
%  plot(expand_posture(x,4),expand_posture(y,4),'*b');
%  plot(expand_posture(x,end),expand_posture(y,end),'*b');
end