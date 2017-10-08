function str_norm=PCA_MAP(str)
%normalization 
[x,y]=size(str);
str_norm = zeros(x,y);
for i = 1:x
    mini=min(str(i,:));
    maxi=max(str(i,:));
    str_norm(i,:)=2*(str(i,:) - mini)/(maxi-mini)-1;
end
PCA_colorMap(str_norm)