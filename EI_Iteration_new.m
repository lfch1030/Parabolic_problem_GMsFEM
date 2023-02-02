

A0=R0free'*Afree*R0free;
M0=R0free'*Mfree*R0free;
N_new=Mfree\Afree;

SOL1=SOL*0;
SOL1=SOL;

Matrix1=1; %0:matrix for Phipade &1:SVD

    if Matrix1==0  
       Anew1=M0\A0;
       phi1 = phipade(-dt*Anew1,1); 
      % Bnew1=M0\(R0'*A);
       SOLfree=SOL1(free);    
         
            for itime=1:N_steps              
               F1=Source_fine_mesh(SOL1);
               resEI=M*F1-A*SOL1;
               M0Inv=M0^(-1);
               SOL_2 =dt*phi1*M0Inv*R0free'*(resEI(free));
               SOL2 = R0free*SOL_2;
               SOL1(free) = SOL1(free)+SOL2;        
            end
    else
      [Q2,D1]=eig(full(-dt*N_new));
       for i=1:size(D1,1)
            D2(i,i)=1/(D1(i,i))*(exp(D1(i,i))-1);
       end
      MatQ=Q2'*M0*Q2;
      DMatQ=diag(1./diag(MatQ));
      Q3=Q2*DMatQ;
      phi1=Q2*D2*Q3';   
      
      SOLfree=SOL1(free);    
         
        for itime=1:N_steps
  
            F1=Source_fine_mesh(SOL1);
            resEI=M*F1-A*SOL1;
            SOL_2 =dt*phi1*R0free'*(resEI(free));
            SOL2 = R0free*SOL_2;
            SOL1(free) = SOL1(free)+SOL2; 
   
        end
    end




f2=figure;
plot_vector(SOL1,Exact,dom,Nx,Ny,1,add);
f2.Position=[0 0 1300 500];

EISOL=SOL1;