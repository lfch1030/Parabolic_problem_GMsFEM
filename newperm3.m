


M=mu; %contrast


rand('twister',50482)
k=ones(100,100);
R=7;

for i=1:3
    
   k( 12*(i-1)+(10:16),:)=M;
   
end

for i=1:7
   k( (50:90), 12*(i-1)+(10:15))=M;
end


k(1:10,:)=1;
k(91:100,:)=1;
k(:,1:10)=1;
k(:,91:100)=1; 