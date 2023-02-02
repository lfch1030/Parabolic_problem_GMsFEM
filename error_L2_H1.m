function error_L2(u,exact,dom,Nx,Ny,nx,ny)
% function plot_vector(u,dom,Nx,Ny)
subplot(1,2,1)
color=0;
X2=[];
Y2=[];
Z2=[];
X3=[];
Y3=[];
Z3=[];
    Z12=[];
for i1=1:Nx
    X2=[];
    Y2=[];
    Z2=[];
    Z21=[];

    for i2=1:Ny
        color=color+1;
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        col=dom(i1,i2).Ig;
        %trisurf(M,v(:,1),v(:,2),full(u(col)),'EdgeColor','none');
        TR = triangulation(M,v(:,1),v(:,2),full(u(col)));
        X1=TR.Points(:,1);
        Y1=TR.Points(:,2);
        Z1=TR.Points(:,3);

        X11=reshape(X1,sqrt(size(X1,1)),sqrt(size(X1,1)));
        Y11=reshape(Y1,sqrt(size(X1,1)),sqrt(size(X1,1)));
        Z11=reshape(Z1,sqrt(size(X1,1)),sqrt(size(X1,1)));
        X2=[X2,X11(1:end-1,1:end-1)];
        Y2=[Y2,Y11(1:end-1,1:end-1)];
        Z2=[Z2,Z11(1:end-1,1:end-1)];
        Z21=[Z21;Z11(end,1:end-1)];
       
        %surf(X11,Y11,Z11,'EdgeColor','none');
        %hold on
    end
    Z12=[Z12;Z11(1:end-1,end)];
    X3=[X3;X2];
    Y3=[Y3;Y2];
    Z3=[Z3;Z2];
    
end
      %  X22=reshape(X2,sqrt(size(X1,1)),sqrt(size(X1,1)))
 Z21=Z21(:)';
 Z21=[Z21,0];
 Z3=[Z3,Z12];
 Z3=[Z3;Z21];
 X       = linspace(0,1,sqrt(size(u,1)));                                   
 Y       = linspace(0,1,sqrt(size(u,1)));
 [MY,MX] = meshgrid(X,Y); 
 surf(MX,MY,Z3,'EdgeColor','none');

xlabel('x')
ylabel('y')
title('Approximation solution')
%view(1);

subplot(1,2,2)
surf(MX,MY,exact','EdgeColor','none');
title('Exact solution')
norm(exact'-Z3)/norm(exact)

%view(1);