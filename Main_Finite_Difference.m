close all;
clear all;
Visivel     = 'on';         
for n=[2]
    for N=1
        exponent=n;
        mu=10^((exponent-1));
        load('Juan1','A'); 
        A=A*0+1;
        A(:,end) = []; %Quita ultima columna
        
        
        k1perm=A; % newperm2 k1perm=k'
        max_it=2000;tol=1e-6;
        ax=0;bx=1;ay=0;by=1;
        Nx=10; Ny=Nx;
        nx=10; ny=nx;
        LIM=[0,1,0,1];
        Matrix_error=[];
        
        for add=[5]

            [dom,dom_ov,b,u0,bnew,xd]=maintwoB(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol,add);
            
            xdir=b*0;
            pold=b*0;
                   
            nv=(Nx*nx+1)*(Ny*ny+1);
           
            finematrix
            matrixR
                   
            Iteration_Methods;
            
            Error_GMsFEM_EI_FD;
  
        end
    end
end


