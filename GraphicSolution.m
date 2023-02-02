function  F = GraphicSolution(UR,Exact,LIM,Figure_Visivel)
global nav
Nx = sqrt(numel(UR(:)));
num = Nx;
Uplot   = UR(1:Nx^2);                                                      % Extraindo do vetor solução os coeficentes da expanção de FV
Nplot   = min(Nx,num+1);                                                   % Numero de pontos a sren representados em cada aresta
step    = max(1,floor(Nx/(num)));                                          % Tamanho de paso para a escolha de potos a ser graficados do total
X       = linspace(LIM(1),LIM(2),Nplot);                                   % Ordenadas dos pontos da malha
Y       = linspace(LIM(3),LIM(4),Nplot);                                   % Absisas dos pontos da malha
[MY,MX] = meshgrid(X,Y);                                                   % Construindo a malha.
Uplot   = reshape(Uplot,[Nx,Nx]);                                          % Reordenando os coeficientes de FV numa matriz
Uplot   = Uplot(1:step:end,1:step:end);
SOL     = Exact;

F = figure;
set(F, 'Visible', Figure_Visivel);
F.PaperUnits = 'centimeters';
F.PaperPosition = [0 0 26 10];
F.PaperSize=[26 10];


  subplot(1,2,1);
    s1 = surf(MX,MY,SOL);
    colorbar
    s1.EdgeColor = 'none';
    pbaspect([1 1 1]);
    xlabel('x')
    ylabel('y')
    xticklabels({'0','0.5','1'})
    yticklabels({'0','0.5','1'})
    title('Solution in fine mesh')
   % view(2)

  subplot(1,2,2);
    s2=surf(MX,MY,Uplot);
    s2.EdgeColor = 'none';
    colorbar
    pbaspect([1 1 1]);
    xticklabels({'0','0.5','1'})
    yticklabels({'0','0.5','1'})
    xlabel('x')
    ylabel('y')   
    title(join(['Solution p_{ms}^{(',num2str(nav),')}']))
  %  view(2)

end



