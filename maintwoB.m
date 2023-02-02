function [dom,dom_ov,b,bnew,xd]=maintwoB(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol,add)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function

%ov=5;


[dom_ov,nvel_ov]=localsetting_ov2(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);
[dom,b,nvel]=localsetting(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);

w=createlinear(b,dom,Nx,Ny);

xd=w-zerodir(w,dom,Nx,Ny);

Axd=applay_AN(xd,dom,Nx,Ny);
Axd=zerodir(Axd,dom,Nx,Ny);
bnew=b-Axd;

dom_ov=localeigenvectors(b,dom_ov, Nx,Ny,add);

dom_ov=linearones(dom,dom_ov,Nx,Ny,b);
dom_ov=linearones2(dom,dom_ov,Nx,Ny,b);

dom_ov=linearms(dom,dom_ov,Nx,Ny,b);

dom_ov=emfpuK22B(dom,dom_ov,Nx,Ny,b,mu);
dom_ov=emfpuK22MSB(dom,dom_ov,Nx,Ny,b,mu);
dom_ov=emfBADmsB(dom,dom_ov,Nx,Ny,b);
dom_ov=emfBADmsreducedB(dom,dom_ov,Nx,Ny,b);


