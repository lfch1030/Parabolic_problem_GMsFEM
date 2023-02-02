dimC=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        dimC=dimC+dom_ov(i1,i2).Nbad;
    end
end

R0=sparse(nv,dimC);
I=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        Nbad=dom_ov(i1,i2).Nbad;
        for l=1:Nbad
            I=I+1;
            phi1=dom_ov(i1,i2).cb(l).phi;
            R0(:,I)=phi1;
        end
    end
end

R0_1=sparse(nv,dimC); %without weights
I=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        Nbad=dom_ov(i1,i2).Nbad;
        for l=1:Nbad
            I=I+1;
            phi1=dom_ov(i1,i2).cb1(l).phi;
            R0_1(:,I)=phi1;
        end
    end
end






dirn=[];
vC=[];
P1=[];
dir=[];
dimC=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        dimC=dimC+dom_ov(i1,i2).Nbad;
    end
end

I=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        NbadI=dom_ov(i1,i2).Nbad;
        for l=1:NbadI
            I=I+1;
            J=0;
            if i1==1 || i1==Nx+1|| i2==(Ny+1) || i2==1
                dir=[dir,I];
            end

        end
    end
end

I1=[];
I=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        NbadI=dom_ov(i1,i2).Nbad;
        for l=1:NbadI
            I=I+1;
                if l==1
                    dirn=[dirn,I];
                    vC=[vC;dom_ov(i1,i2).c];
                    Ig=dom_ov(i1,i2).Ig;
                    psi1=dom_ov(i1,i2).psibad(:,1);
                    P1=[P1;psi1(Ig(1))];
                    I1=[I1,I];
                end
                

        end
    end
end

newI=setdiff((1:dimC),dir);
R02=zeros(nvel,size(newI,2));

R02=R0(:,newI);
A0=R02'*A*R02;
M0=R02'*M*R02;
R0=R02;

R021=R0_1(:,newI);
A0=R02'*A*R02;
M0=R02'*M*R02;
R0_1=R021;


x0d=sparse(dimC,1);
X=vC(:,1);
Y=vC(:,2);
x0d_aux=boundary_condition(X,Y)./P1;
x0d(I1)=x0d_aux;
