function pearson_indx = PCA_pearson(sin_theta_all,vertex_value04)
% vertex_value04; sin_theta_all;
length = size(sin_theta_all,2);
CaTrace_theta = zeros(2,length);
CaTrace_theta(1,:)=sin_theta_all(1,:);
indx_v = vertex_value04(1,:);
for i = 1:length
   the_ind = find(indx_v ==sin_theta_all(2,i));
   CaTrace_theta(2,i)=vertex_value04(2,the_ind);
end
pearson_indx = corrcoef(CaTrace_theta(1,:),CaTrace_theta(2,:));
pearson_indx = pearson_indx(1,2);
plot(CaTrace_theta(1,:),CaTrace_theta(2,:),'o')
legend(['pearson indx:  ',num2str(pearson_indx)])

