close all

T=0.02;
N_steps=10;
dt      = T/N_steps;
% R0new1=R0;
% for NvxN=2
%    R0new=R0new1(:,1:add+1:end);
% end

xmat=vertices(:,1);
ymat=vertices(:,2);


Afree=A(free,free);
Mfree=M(free,free);
SOL=u0(xmat,ymat);
%plot_vector(SOL,Exact,dom,Nx,Ny);

%R0sp=R0'*R0;
%R0t=R0sp\R0';

R0free=R0(free,:);
R0free1=R0_1(free,:);

M0=R0'*M*R0;

SOL00=R0*M0^(-1)*R0'*M*SOL;


Method=0;

if Tant~=T
    FD_Iteration_fine_mesh;
    %ExactFD = Ref_Sol_Exact(T,LIM,xmat,ymat)
    CsolFine=1
    Tant=T;
end
%  if Method==0
FD_Iteration;
EI_Iteration;
%    end