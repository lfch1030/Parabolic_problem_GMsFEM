function plot_vector(u,dom,Nx,Ny,Method,add)
% function plot_vector(u,dom,Nx,Ny)

%subplot(1,2,1)
color=0;
for i1=1:Nx
    
    for i2=1:Ny
        color=color+1;
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        col=dom(i1,i2).Ig;
        trisurf(M,v(:,1),v(:,2),full(u(col)),'EdgeColor','none');
        
        hold on
    end
   
        
end
      %  X22=reshape(X2,sqrt(size(X1,1)),sqrt(size(X1,1)))
       
 %surf(X3,Y3,Z3,'EdgeColor','none');

end