M=mu+1;  %contrast

k=ones(100,100);

% 
% k(22:24,:)=M;
% k(30:32,:)=M;
% k(36:37,:)=M;
% 
% k(1:20,:)=1;
% k(41:60,:)=1;
% 
% k(:,1:20)=1;
% k(:,41:60)=1;


k(12:13,:)=M;
k(15:16,:)=M;
k(18:19,:)=M;

k(1:10,:)=1;
k(21:30,:)=1;

k(:,1:10)=1;
k(:,21:30)=1;