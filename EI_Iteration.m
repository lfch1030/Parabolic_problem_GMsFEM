

%A0=R0free'*Afree*R0free;
%M0=R0free'*Mfree*R0free;

A0=R0'*A*R0;
M0=R0'*M*R0;
time_EI=zeros(10,1);

SOL1=SOL00*0;
SOL1=SOL00;

Matrix1=0; %0:matrix for Phipade &1:SVD

    if Matrix1==0  
        tic
       Anew1=M0\A0;
       phi1 = phipade(-dt*Anew1,1); 
       phi1_0 =R0*phi1*R0';
      % Bnew1=M0\(R0'*A);
       SOLfree=SOL1(free);
       time_phipade=toc;
         tic
            for itime=1:N_steps 
                
               
               F1=Source_fine_mesh(SOL1,type_problem,Fun1);
               resEI=M*F1-A*SOL1;
               M0Inv=M0^(-1);
               SOL_2 =dt*phi1*M0Inv*R0free'*(resEI(free));
               SOL2 = R0free*SOL_2;
               SOL1(free) = SOL1(free)+SOL2; 
               time_EI(itime)=toc;
            end
    else
        tic
      [Q2,D1]=eig(full(-dt*A0),full(M0));
      %D1=-dt*D1;
       for i=1:size(D1,1)
            D2(i,i)=1/(D1(i,i))*(exp(D1(i,i))-1);
       end
      MatQ=Q2'*M0*Q2;
      DMatQ=diag(1./diag(MatQ));
      Q3=Q2*DMatQ;
      phi1=Q2*D2*Q3';   
      
      SOLfree=SOL1(free);    
      phi1_0 =R0*phi1*R0';
      %phi1_0 =R0free*phi1*R0free';
      time_SVD=toc;
     tic
      for itime=1:N_steps
          
          
            F1=Source_fine_mesh(SOL1,type_problem,Fun1);
            resEI=M*F1-A*SOL1;
            SOL2 = dt*phi1_0(free,free)*(resEI(free));
            SOL1(free) = SOL1(free)+SOL2;  
            time_EI(itime)=toc;
       end
    end
 %SOL1(free)=SOLfree;

 %Anew1=M\A;
 %phiMatlab = phipade(-dt*Anew1,1); 

 %max(max(phiMatlab-phi1_0))
time_EIm=mean(diff(time_EI));

EISOL=SOL1;
