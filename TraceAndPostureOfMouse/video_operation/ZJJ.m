day = [1	2	3	4	5	6	7	8];
value = [0	2	4	3	10	9	8	8];
value = (value - min(value))./(max(value) - min(value));

DATA = [day ;
       value];
   
a=0.001;
lambda =0.02;
%************************************************************************
DATA = DATA';
[m,n]=size(DATA);
x = [ones(m,1),DATA(:,1:end-1)];
y = DATA(:,end);
theta = zeros(1,n);
x4show = [ones(21,1),(0:0.5:10)'];  % just for test
plot(DATA(:,1),DATA(:,2),'b*');
hold on
for i = 1:1000
h_theta_x = 1./(1+exp(-theta*x'));
theta = theta - a*(h_theta_x-y')*x+(lambda/m).*theta;
J_theta_x = (-1/m)*sum(y*log(h_theta_x)+(1-y)*log(1-h_theta_x));
%plot(0:0.5:10,1./(1+exp(-theta*x4show')));
end
plot(0:0.5:10,1./(1+exp(-theta*x4show')),'or');
ANSWER = -theta(1)/theta(2)
ANSWER3_4 = (-theta(1)-log(1/3))/theta(2)