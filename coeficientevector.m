function y=coeficientevector(u,dom,Nx,Ny,mu,k1perm)
% function plot_vector(u,dom,Nx,Ny)
y=u*0;
color=0;
for i1=1:Nx
    for i2=1:Ny
        color=color+1;
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        col=dom(i1,i2).Ig;
        y(col)=coeficient(v(:,1),v(:,2),mu,k1perm);
    end
end


