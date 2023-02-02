basis=figure;
omega_i=5;
omega_j=5;

plot_vector(dom_ov(omega_i,omega_j).psibad(:,2),dom,Nx,Ny,Method,add);

for i=1:omega_i-1
    
plot3([0,1], [1*(i-1)/Nx,1*(i-1)/Nx],[0.01,0.01],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
hold on
plot3([(i-1)/Nx,(i-1)/Nx], [0,1],[0.01,0.01],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
%colormap(map1);
end

for i=omega_i+1:Nx
    
plot([0,1], [1.02*(i-1)/Nx,1.02*(i-1)/Nx],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
hold on
plot([1.02*(i-1)/Nx,1.02*(i-1)/Nx], [0,1],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
%colormap(map1);
end

plot3([0,(omega_i-2)/Nx], [1*(omega_i-1)/Nx,1*(omega_i-1)/Nx],[0.01,0.01],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
hold on
plot3([(omega_i-1)/Nx,(omega_i-1)/Nx], [0,(omega_i-2)/Nx],[0.01,0.01],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
plot3([(omega_i)/Nx,1], [1*(omega_i-1)/Nx,1*(omega_i-1)/Nx],[0.01,0.01],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
hold on
plot3([(omega_i-1)/Nx,(omega_i-1)/Nx], [(omega_i)/Nx,1],[0.01,0.01],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)


grid on
grid minor




basis.Position=[0 0 300 250]; 

%colorbar;
shading flat
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
title('The second basis in $\omega_i$','Interpreter','latex','FontSize',12)
%view(2);

exportgraphics(basis,['figure\basis_2.pdf'],'ContentType','vector')