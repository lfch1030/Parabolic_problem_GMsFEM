M=10^(exponent-1);

k=ones(80,80);

for i=1:2:8
          k(2+(i-1)*10:6+(i-1)*10,1:10)=M;
          k(4+(i-1)*10:8+(i-1)*10,11:20)=M;
          k(5+(i-1)*10:9+(i-1)*10,21:30)=M;
           
          k(2+(i-1)*10:5+(i-1)*10,41:50)=M;
          k(4+(i-1)*10:7+(i-1)*10,51:60)=M;
          k(5+(i-1)*10:8+(i-1)*10,61:70)=M;
end

% 
% for j=4:4:8 
% k(:,(j-1)*10+1:j*10)=1;
% end


for i=2:2:8
    for j=1:8
k(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=M;

    end
end



for i=1:2:8
    for j=1:7
     k(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=M;
    end
end


for i=2:2:8
%  k((i-1)*10+4:(i-1)*10+6,21:50)=M;
 k((i-1)*10+2:(i-1)*10+5,21:30)=M;
  k((i-1)*10+3:(i-1)*10+6,31:40)=M;
   k((i-1)*10+4:(i-1)*10+7,41:50)=M;
end


for i=2:2:8
  k((i-1)*10+4:(i-1)*10+6,71:80)=M;
end


k(1:10,:)=1;
k(71:80,:)=1;
k(:,1:10)=1;
k(:,71:80)=1;

