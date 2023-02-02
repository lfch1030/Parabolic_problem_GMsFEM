function F1 = Source_fine_mesh(SOL1,value,Fun1)
    
switch value
    case 'Linear'
        F1=(5*pi^2-1)*SOL1*0;
    case 'Semilinear'
        F1=Fun1(SOL1);
        %F1=-1/0.05^2.*(SOL1.^3-SOL1);
end

end