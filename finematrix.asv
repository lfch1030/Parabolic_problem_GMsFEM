nvel=length(b);
A=sparse(nvel,nvel);
opO=A;

free=[];
%Ap= applay_A(p,dom,Nx,Ny)
%+(0.5/deltat)*applay_M(p,dom,Nx,Ny)+
%0.5*apply_O1(p,dom,Nx,Ny,N0left,N0right);
vertices=zeros(nvel,2);
for i1=1:Nx
    for i2=1:Ny
    free=[free,dom(i1,i2).Igfree];
    vertices(dom(i1,i2).Ig,:)=dom(i1,i2).v;
    end
       
end
free=unique(free);
%free=setdiff(free,[1,Nx*nx+1]);

Anorma=sparse(nvel,nvel);
for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;
            MI=dom(i1,i2).Mass;
            AI=dom(i1,i2).A;
    Anorma(Ig,Ig)=Anorma(Ig,Ig)+AI;
    
    end
end

A_s=sparse(nvel,nvel); %without weights
for i1=1:Nx
    for i2=1:Ny
        Ig=dom(i1,i2).Ig;
        MI=dom(i1,i2).Mass;
        AI=dom(i1,i2).A1;
        A_s(Ig,Ig)=A_s(Ig,Ig)+AI;
    
    end
end

M_w=sparse(nvel,nvel);   %with weights

for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;
    MI=dom(i1,i2).Mass;
    AI=dom(i1,i2).A;
    M_w(Ig,Ig)=M_w(Ig,Ig)+MI;
    
    end
end

M=sparse(nvel,nvel);   %without weights

for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;
    MI=dom(i1,i2).Mass1;
    AI=dom(i1,i2).A;
    M(Ig,Ig)=M(Ig,Ig)+MI;
    
    end
end


% for i1=1:Nx
%     for i2=1:Ny
%     Ig=dom(i1,i2).Ig;
%             MI=dom(i1,i2).Mass;
%             AI=dom(i1,i2).A;
%     A(Ig,Ig)=A(Ig,Ig)+AI+(0.5/deltat)*MI;
%     
%     end
% end



A=Anorma;

