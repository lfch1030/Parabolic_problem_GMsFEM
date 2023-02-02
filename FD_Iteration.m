"Time_iteration_FD"
Teta=1;
time_FD=zeros(10,1);

SOL1=SOL00*0;
SOL1=SOL00;
AauxMdtA=M + Teta *dt * A;
GM_A = R0free'*(AauxMdtA(free,free))*R0free; 
%GM_Af=GM_A(free,free);
GM_M = M - (1-Teta) *dt * A;

for itime=1:N_steps
    tic
    " "
    
               F1=M*Source_fine_mesh(SOL1,type_problem,Fun1);
                
               F2=F1;
               resFD=GM_M*SOL1 + dt*(Teta * F2  +  (1-Teta)*F1);
               SOL_1=resFD*0;
               SOL_1f = GM_A \ (R0free'*resFD(free));
               SOL_1(free)=R0free*SOL_1f;
               
               err   = 1; numIt = 0;

              
                %%%%  Corrector  %%%%%%
             
%             while err > 10^-10 && numIt<5
%                 numIt = numIt+1;
%                
%                 F2   = M*Source_fine_mesh(SOL_1,LoS);
%                 resFD=GM_M*SOL1 + dt*(Teta * F2  +  (1-Teta)*F1);
%                 SOL_2=resFD*0;
%                %SOL_1free = (AauxMdtA(free,free)) \ residuo(free);
%                SOL_2free = GM_A \ (R0free'*resFD(free));
%                SOL_2(free)=R0free*SOL_2free;
%                 err   = sum(sum(abs(SOL_1-SOL_2)))/sum(sum(abs(SOL1)));
%                 SOL_1 = SOL_2;
%             end
% 
%                 F1=F2;
                SOL1 = SOL_1;
           
                
time_FD(itime)=toc;
end
   
             Medium;
             
             
             FDSOL=SOL1;
              time_FDm=mean(diff(time_FD));
          