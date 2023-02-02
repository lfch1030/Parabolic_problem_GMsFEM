function dom_ov=localeigenvectors(x,dom_ov, Nx,Ny,add)

for i1=1:Nx+1
    for i2=1:Ny+1
        A=dom_ov(i1,i2).A;
        A1=dom_ov(i1,i2).A1;
        M=dom_ov(i1,i2).Mass;
        M1=dom_ov(i1,i2).Mass1;
        
        [Q,D]=eig(full(A),full(M));
        [lambda,I]=sort(diag(D),'ascend');
        Q=Q(I,I);

        [Q1,D1]=eig(full(A1),full(M1));
        [lambda1,I1]=sort(diag(D1),'ascend');
        Q=Q(I,I);

       

        


        Ig=dom_ov(i1,i2).Ig;
        nlambda=max(size(lambda));
        incre=diff(lambda);
        Iincre=incre>2;
        I=1:nlambda-1;
        Ig90=I(Iincre);
        if size(Ig90,2)>=1
            %         Nbad=1;
            %         else
            Nbad=Ig90(1);
        else
            Nbad=1;
        end
        %         end
        %        Nbad=4;
        %        Nbad=2;
        if i1~=1 & i2~=1
            if i1~=(Nx+1) & i2~=(Ny+1)
                Nbad=Nbad+add;
            end
            end
            n=size(x,1);
            psi1=sparse(n,Nbad);                 %With weights
            psi1(Ig,1:(Nbad+1))=Q(:,1:(Nbad+1));

            psi2=sparse(n,Nbad);                 %without weights
            psi2(Ig,1:(Nbad+1))=Q1(:,1:(Nbad+1)); 
            % %                 if i1==1 && (i2==3 || i2==4)
            % %                     psi2=-psi2;
            % %                 end
            % %                 if i1==2 && (i2==1 || i2==2 || i2==4)
            % %                     psi2=-psi2;
            % %                 end
            % %                 if i1==3 && (i2==2  || i2==4)
            % %                     psi2=-psi2;
            % %                 end
            % %                 if i1==4 &&(  i2==3 ||i2==4 )
            % %                     psi2=-psi2;
            % %                 end
            dom_ov(i1,i2).psibad=psi1;
            dom_ov(i1,i2).psibad1=psi2;
            %         [i1,i2]
            %         psi1(1,1)
            %         lambda(1:3)
            %         pause
            dom_ov(i1,i2).Nbad=Nbad;
            dom_ov(i1,i2).lambda=lambda;
            dom_ov(i1,i2).lambda1=lambda1;
            
            
        end
    end
