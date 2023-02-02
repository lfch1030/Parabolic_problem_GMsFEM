function [dom,b,nvel]=localsetting(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function


hx=(bx-ax)/(Nx*nx);
hy=(by-ay)/(Ny*ny);

Hx=(bx-ax)/Nx;
Hy=(by-ay)/Ny;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Setting mesh \n');

intx=[ax,bx];
inty=[ay,by];
ov=0;
%%%  hbar=waitbar(0,':)');
%%% hbarn=0;
for i1=1:Nx
    for i2=1:Ny
        %%% hbarn=hbarn+1;
        %%% waitbar(hbarn/(Nx*Ny),hbar);
        intx=[ax+(i1-1)*(bx-ax)/Nx-ov*hx*(i1>1),ax+(i1)*(bx-ax)/Nx+ov*hx*(i1<Nx)];
        inty=[ay+(i2-1)*(by-ay)/Ny-ov*hy*(i2>1),ay+(i2)*(by-ay)/Ny+ov*hy*(i2<Nx)];
        [M,B,v,mesh,h,Igfree,Ig,free]=createmeshAS(nx,ny,intx,inty,Nx,Ny,i1,i2,ov);
        dom(i1,i2).M=M;
        dom(i1,i2).B=B;
        dom(i1,i2).v=v;
        dom(i1,i2).mesh=mesh;
        dom(i1,i2).h=h;
        dom(i1,i2).Ig=Ig;
        dom(i1,i2).Igfree=Ig;
        dom(i1,i2).free=1:size(Ig,2);
        dom(i1,i2).Igfreedir=Igfree;
        dom(i1,i2).freedir=free;
        
    end
end
% close(hbar);
 for i1=1
     for i2=1:Nx
         vleft=dom(i1,i2).B.vleft;
         Ig=dom(i1,i2).Ig;
         free=dom(i1,i2).free;
         free=setdiff(free,vleft);
         Igfree=Ig(free);
         dom(i1,i2).Igfree=Igfree;
         dom(i1,i2).free=free;
     end
 end
clear vleft
for i1=Nx
    for i2=1:Ny
        vright=dom(i1,i2).B.vright;
        Ig=dom(i1,i2).Ig;
        free=dom(i1,i2).free;
        free=setdiff(free,vright);
        Igfree=Ig(free);
        dom(i1,i2).Igfree=Igfree;
        dom(i1,i2).free=free;
    end
end
clear vright
for i1=1:Nx
    for i2=1
        vdown=dom(i1,i2).B.vdown;
        Ig=dom(i1,i2).Ig;
        free=dom(i1,i2).free;
        free=setdiff(free,vdown);
        Igfree=Ig(free);
        dom(i1,i2).Igfree=Igfree;
        dom(i1,i2).free=free;
    end
end
clear vdown

for i1=1:Nx
    for i2=Ny
        vup=dom(i1,i2).B.vup;
        Ig=dom(i1,i2).Ig;
        free=dom(i1,i2).free;
        free=setdiff(free,vup);
        Igfree=Ig(free);
        dom(i1,i2).Igfree=Igfree;
        dom(i1,i2).free=free;
    end
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
nvel=(Nx*nx+1)*(Ny*ny+1);
b=sparse(nvel,1);
b1=sparse(nvel,1);
%%% hbarn=0;
%%% hbar=waitbar(0,':)');
for i1=1:Nx
    for i2=1:Ny
    %%%     hbarn=hbarn+1;
    %%%    waitbar(hbarn/(Nx*Ny),hbar)
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        mesh=dom(i1,i2).mesh;
        free=dom(i1,i2).free;
        Boundary=dom(i1,i2).B;
        [Asd,bsd]=Nmatrix(M,v,mesh,mu,k1perm);
        [Asd1,bsd1]=Nmatrix(M,v,mesh,mu,k1perm*0+1);
        Massd=NMassmatrix(M,v,mesh,mu,k1perm);
        Mass1=NMassmatrix(M,v,mesh,mu,k1perm*0+1);
        Bleft=Bmatrixleft(M,v,mesh,Boundary,mu,k1perm);
        Bright=Bmatrixright(M,v,mesh,Boundary,mu,k1perm);
        Bdown=Bmatrixdown(M,v,mesh,Boundary,mu,k1perm);
%        BdownNOk=BmatrixdownNOk(M,v,mesh,Boundary,mu,k1perm);
        Bup=Bmatrixup(M,v,mesh,Boundary,mu,k1perm);
        BleftNOk=Bmatrixleft(M,v,mesh,Boundary,mu,k1perm*0+1);
        BrightNOk=Bmatrixright(M,v,mesh,Boundary,mu,k1perm*0+1);
        BupNOk=Bmatrixup(M,v,mesh,Boundary,mu,k1perm*0+1);

        
        dom(i1,i2).Mass=Massd;
        dom(i1,i2).Mass1=Mass1;
        dom(i1,i2).A=Asd;
        dom(i1,i2).A1=Asd1;
        dom(i1,i2).Bleft=Bleft;
        dom(i1,i2).Bright=Bright;
        dom(i1,i2).Bdown=Bdown;
        dom(i1,i2).Bup=Bup;

        dom(i1,i2).BupNOk=BupNOk;
        dom(i1,i2).BrightNOk=BrightNOk;
        dom(i1,i2).BleftNOk=BleftNOk;
        dom(i1,i2).b=bsd(free);
        dom(i1,i2).b1=bsd1(free);
        colI=dom(i1,i2).Igfree;
        b(colI)=b(colI)+bsd(free);
        b1(colI)=b1(colI)+bsd1(free);
    end
end




%%% close(hbar)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% % fprintf('Assambling Global Right Hand Side \n');
% % nvel=(Nx*nx+1)*(Ny*ny+1);
% % b=sparse(nvel,1);
% % %plot_vector(b,dom,Nx,Ny)
% %  for i1=1:Nx
% %     for i2=1:Ny
% %         colI=dom(i1,i2).Igfree;
% %         freel=dom(i1,i2).free;
% %         b(colI)=b(colI)+dom(i1,i2).b(freel);
% % %        plot_vector(b,dom,Nx,Ny)
% % %        pause
% %     end
% % end



% % % fprintf('Assambling Matrices \n');
% % % 
% % % 
% % % [A,b]=Nmatrix(M,v,mesh);
% % % 
% % % 
% % % 
% % % upT=B.up;
% % % upv=M(upT,[2,3]);
% % % upv=unique(upv(:));
% % % 
% % % leftT=B.left;
% % % leftv=M(leftT,[1,3]);
% % % leftv=unique(leftv(:));
% % % 
% % %  downT=B.down;
% % %  downv=M(downT,[1,2]);
% % %  downv=unique(downv(:));
% % % 
% % %  rightT=B.right;
% % %  rightv=M(rightT,[2,3]);
% % %  rightv=unique(rightv(:));
% % %  
% % %  d=unique([upv,leftv,downv,rightv]);
% % % free=setdiff(1:mesh.nv,d);
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % %%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % u=sparse(mesh.nv,1);
% % % u(free)=A(free,free)\b(free);
% % % 
% % % el2=error_l2(u,M,v,mesh);
% % % eh1=error_h1(u,M,v,mesh);
