

M=mu; %contrast


rand('twister',50482)
k=ones(100,100);


for i=1:50
    for j=10:8:90
        k( j+(1:3),i)=M;
    end
end

for i=1:100
    for j=10:8:50
        k( i,j+(1:3)+45)=M;
    end
end

k(1:10,:)=1;
k(91:100,:)=1;
k(:,1:10)=1;
k(:,91:100)=1; 
k(101:end,:)=[];
k(:,101:end)=[];