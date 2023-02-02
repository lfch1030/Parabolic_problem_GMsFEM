

SOL1=SOL*0;
SOL1=SOL;

Matrix1=1; %0:matrix for Phipade &1:SVD

    if Matrix1==0  
       Anew1=M\A;
       phi1 = phipade(-dt*Anew1,1); 
      % Bnew1=M0\(R0'*A);
       M_InvA=M\A;
       SOLfree=SOL1(free);    
         
            for itime=1:N_steps              
               F1=(5*pi^2-1)*SOL1;
               resEI=F1-M_InvA*SOL1;            
               SOL_2 =dt*phi1(free,free)*(resEI(free));
               %SOL2 = R0free*SOL_2;
               SOL1(free) = SOL1(free)+SOL_2;        
            end
    else
      phi1=phi4eig(A(free,free),M(free,free),dt);
      SOLfree=SOL1(free);    
         
        for itime=1:N_steps
  
            F1=(5*pi^2-1)*SOL1;
            resEI=M*F1-A*SOL1;
            SOL_2 =dt*phi1*(resEI(free));
            SOL1(free) = SOL1(free)+SOL_2; 
   
        end
    end

    Anew1=M\A;
    
 figure
 plot_vector(SOL1,ExactFD,dom,Nx,Ny,1,add);
 ExactEI=SOL1;