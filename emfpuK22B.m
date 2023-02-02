function dom_ov=emfpuK22B(dom,dom_ov,Nx,Ny,b,mu)



%xaux = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%[xaux, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);

for i1=1:Nx+1
    for i2=1:Ny+1
        philin=dom_ov(i1,i2).philin;
        Nbad=dom_ov(i1,i2).Nbad;
        for l=1:Nbad
        u=dom_ov(i1,i2).psibad(:,l);
      
        phiaux=philin.*u;
        maxp=max(phiaux);
        minp=min(phiaux);
        if abs(maxp)>abs(minp)
            phiaux=phiaux/maxp;
        else
            phiaux=phiaux/minp;
        end
 
        
        dom_ov(i1,i2).cb(l).phi=phiaux;
        end

        for l=1:Nbad
        u1=dom_ov(i1,i2).psibad1(:,l);
      
        phiaux=philin.*u1;
        maxp=max(phiaux);
        minp=min(phiaux);
        if abs(maxp)>abs(minp)
            phiaux=phiaux/maxp;
        else
            phiaux=phiaux/minp;
        end
 
        
        dom_ov(i1,i2).cb1(l).phi=phiaux;
        end

%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end
