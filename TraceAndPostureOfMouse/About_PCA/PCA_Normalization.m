function str2=PCA_Normalization(coeff)
%normalization 
mini=min(min(coeff));
maxi=max(max(coeff));
str2=(coeff - mini)/(maxi-mini);