
%M=1e+5; %contrast
M=mu+1;
k=ones(80,80);
R=0;
for i=1:2:8
         r1=rand;
          k(2+(i-1)*10:5+(i-1)*10,1:10)=M*(1+R*r1);
          k(4+(i-1)*10:8+(i-1)*10,11:20)=M*(1+R*r1);
           k(5+(i-1)*10:9+(i-1)*10,21:30)=M*(1+R*r1);


           r1=rand;
          k(2+(i-1)*10:5+(i-1)*10,41:50)=M*(1+R*r1);
          k(4+(i-1)*10:7+(i-1)*10,51:60)=M*(1+R*r1);
           k(5+(i-1)*10:8+(i-1)*10,61:70)=M*(1+R*r1);

% %            r1=rand;
% %            k(2+(i-1)*10:5+(i-1)*10,81:90)=M*(1+R*r1);
% %           k(4+(i-1)*10:7+(i-1)*10,91:100)=M*(1+R*r1);

end



for i=2:2:8
    r1=rand;
% %     for j=1:10
% % 
% % k(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=M*(1+R*r1);
% % 
% %     end
  k((i-1)*10+3:(i-1)*10+6,1:10)=M*(1+R*r1);
   k((i-1)*10+4:(i-1)*10+7,11:20)=M*(1+R*r1);
    k((i-1)*10+2:(i-1)*10+5,21:30)=M*(1+R*r1);
  k((i-1)*10+3:(i-1)*10+6,31:40)=M*(1+R*r1);
   k((i-1)*10+4:(i-1)*10+7,41:50)=M*(1+R*r1);
       k((i-1)*10+2:(i-1)*10+5,51:60)=M*(1+R*r1);
  k((i-1)*10+3:(i-1)*10+6,61:70)=M*(1+R*r1);

end


for i=1:2:8
    r1=rand;
    for j=1:8

%k(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=M*(1+R*r1);

    end
% %     k((i-1)*10+2:(i-1)*10+5,21:30)=M*(1+R*r1);
% %   k((i-1)*10+3:(i-1)*10+6,31:40)=M*(1+R*r1);
% %    k((i-1)*10+4:(i-1)*10+7,41:50)=M*(1+R*r1);
end

%
% 
% 
% % k(1:10,:)=1;
% % k(71:80,:)=1;
% % k(:,1:10)=1;
% % k(:,71:80)=1;
% % 
% % 
% % for i=1:8
% % k(3+10*(i-1):7+10*(i-1),3:7)=M;
% % k(3+10*(i-1):7+10*(i-1),73:77)=M;
% % k(3:7, 3+10*(i-1):7+10*(i-1))=M;
% % k(73:77, 3+10*(i-1):7+10*(i-1))=M;
% % end



 k(1:10,:)=1;
 k(71:80,:)=1;
 k(:,1:10)=1;
 k(:,71:80)=1;
% 
