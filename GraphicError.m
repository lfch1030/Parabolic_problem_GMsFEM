f3=figure
plot(Matrix_error(:,1),Matrix_error(:,2), '^-','LineWidth',1.5)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,3), 'o-','LineWidth',1.5)
grid on
grid minor
legend('$L_w^2$ error','$H_w^1$ error','Interpreter','latex','FontSize',12)
title('Relative error for FD','Interpreter','latex','FontSize',12)
xlabel('Number of multiscale basis on each neighborhood','Interpreter','latex')
ylabel('Error','Interpreter','latex')
f3.Position=[0 0 400 300];
xticks(Matrix_error(:,1))

f4=figure
plot(Matrix_error(:,1),Matrix_error(:,4), '^-','LineWidth',1.5)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,5), 'o-','LineWidth',1.5)
grid on
grid minor
legend('$L_w^2$ error','$H_w^1$ error','Interpreter','latex','FontSize',12)
title('Relative error for EI','Interpreter','latex','FontSize',12)
xlabel('Number of multiscale basis on each neighborhood','Interpreter','latex')
ylabel('Error','Interpreter','latex')
xticks(Matrix_error(:,1))
f4.Position=[0 0 400 300];

f5=figure
plot(Matrix_error(:,1),Matrix_error(:,2), '^-','LineWidth',1.5)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,3), 'o-','LineWidth',1.5)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,4), 's-','LineWidth',1.5)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,5), 'p-','LineWidth',1.5)
grid on
grid minor
legend('$L_w^2$ error (FD)','$H_w^1$ error (FD)','$L_w^2$ error (EI)','$H_w^1$ error (EI)','Interpreter','latex','FontSize',12)
title('Relative error for FD and EI','Interpreter','latex','FontSize',12)
xlabel('Number of multiscale basis on each neighborhood','Interpreter','latex')
ylabel('Error','Interpreter','latex')
f5.Position=[0 0 400 300];
xticks(Matrix_error(:,1))
exportgraphics(f5,['figure\FD&EI_Err_',type_problem,'_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_T=',num2str(T),'_nt=',num2str(N_steps),'.pdf'],'ContentType','vector')

writematrix(Matrix_error,['figure\Matrix_error=',type_problem,'_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_T=',num2str(T),'_nt=',num2str(N_steps),'.txt']);