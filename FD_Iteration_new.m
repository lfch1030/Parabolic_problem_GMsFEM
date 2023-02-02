Teta=1/2;

SOL1=SOL*0;
SOL1=SOL;
AauxMdtA=M + Teta *dt * A;
GM_A = R0free'*AauxMdtA(free,free)*R0free; 
%GM_A = R0free1'*M(free,free)*R0free1 + Teta *dt * R0free'*A(free,free)*R0free; 

GM_M = M - (1-Teta) *dt * A;


for itime=1:N_steps

               F1=M*Source_fine_mesh(SOL1);
                
               F2=F1;
               % SOL_1 = GM_A \ (R0'* (GM_M*SOL + dt*(Teta * F2  +  (1-Teta)*F1))); 
               resFD=GM_M*SOL1 + dt*(Teta * F2  +  (1-Teta)*F1);
               SOL_1=resFD*0;
               %SOL_1free = (AauxMdtA(free,free)) \ residuo(free);
               SOL_1free = GM_A \ (R0free'*resFD(free));
               SOL_1(free)=R0free*SOL_1free;
               
               err   = 1; numIt = 0;

%               SB   = R0*SOL_1;
%               F2   = (5*pi^2-1)*SB;
%               SOL_2 = GM_A \ (R0'*(GM_M* SOL  +  dt * (Teta * F2  +  (1-Teta)*F1)));
                %%%%%  Corrector  %%%%%%
             
            while err > 10^-10 && numIt<5
                numIt = numIt+1;      
                F2=M*Source_fine_mesh(SOL_1); 
                resFD=GM_M*SOL1 + dt*(Teta * F2  +  (1-Teta)*F1);
                SOL_2=resFD*0;
                SOL_2free = GM_A \ (R0free'*resFD(free));
                SOL_2(free)=R0free*SOL_2free;
                err   = sum(sum(abs(SOL_1-SOL_2)))/sum(sum(abs(SOL1)));
                SOL_1 = SOL_2;
            end

                %F1=F2;
                SOL1 = SOL_1;
                
                

end
             Medium
             f1=figure;
             plot_vector(SOL1,Exact,dom,Nx,Ny,0,add);
             f1.Position=[0 0 1300 500];
             
             FDSOL=SOL1;