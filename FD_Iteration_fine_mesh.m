Teta=1;
N_steps1=30000;
dt1    = T/N_steps1;

SOL1=SOL*0;
SOL1=SOL;
GM_A1= M + Teta *dt1 * A;
GM_A = GM_A1(free,free); 
GM_M = M - (1-Teta) *dt1 * A;

for itime=1:N_steps1

               F1=M*Source_fine_mesh(SOL1,type_problem,Fun1); 
               F2=F1;
               resFD=GM_M*SOL1 + dt1*(Teta * F2  +  (1-Teta)*F1);
               SOL_1=resFD*0;
               SOL_1free = GM_A \resFD(free);
               SOL_1(free)=SOL_1free;
               err   = 1; numIt = 0;
             
%             while err > 10^-10 && numIt<5
%                 numIt = numIt+1;
%                
%                 F2   = M*Source_fine_mesh(SOL_1); 
%                 resFD=GM_M*SOL1 + dt*(Teta * F2  +  (1-Teta)*F1);
%                 SOL_2=resFD*0;
%                 SOL_2free = GM_A \resFD(free);
%                 SOL_2(free)=SOL_2free;
%                 err   = sum(sum(abs(SOL_1-SOL_2)))/sum(sum(abs(SOL1)));
%                 SOL_1 = SOL_2;
%             end
                SOL1 = SOL_1;
               
end
 Medium
        
 ExactFD=SOL1;
 %ExactFD=resFD;