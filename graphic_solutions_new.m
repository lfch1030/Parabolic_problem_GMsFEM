


fine_f=figure;
plot_vector(ExactFD,dom,Nx,Ny,3,add);
fine_f.Position=[0 0 300 250]; 
colorbar;
shading flat
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
title(' Solution in fine mesh with FD','Interpreter','latex','FontSize',12)
view(2);

 f1=figure;
 plot_vector(FDSOL,dom,Nx,Ny,0,add);
 f1.Position=[0 0 300 250];
 colorbar;
 shading flat
 xlabel('$x$','Interpreter','latex')
 ylabel('$y$','Interpreter','latex')
 title(join(['Solution $p_{ms}^{(',num2str(add),')}$ by FD']),'Interpreter','latex','FontSize',12);
 view(2);

f2=figure;
plot_vector(EISOL,dom,Nx,Ny,1,add);
f2.Position=[0 0 300 250];
colorbar;
shading flat
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
title(join(['Solution $p_{ms}^{(',num2str(add),')}$ by EI']),'Interpreter','latex','FontSize',12);
view(2);



exportgraphics(f1,['figure\FD_Sol_',type_problem,'_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_T=',num2str(T),'_nt=',num2str(N_steps),'.pdf'],'ContentType','vector');
exportgraphics(f2,['figure\EI_Sol_',type_problem,'_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_T=',num2str(T),'_nt=',num2str(N_steps),'.pdf'],'ContentType','vector'); 
exportgraphics(fine_f,['figure\fine_Sol_',type_problem,'_Med=',Medium,'-Cont=',num2str(Contrast),',_T=',num2str(T),'.pdf'],'ContentType','vector'); 
