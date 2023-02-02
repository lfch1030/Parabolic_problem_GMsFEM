close all;
clear all;
Visivel     = 'on';
for n=[3]
    for N=1
        TypeM1=6;       %Type of medium associated
        exponent=n;
        mu=10^((exponent-1));
        %type_problem='Linear';
        type_problem='Semilinear';
        switch TypeM1
            case 1
                Medium='Juan1';
                load('Juan1','A');
                J1=A;
                J1=J1/max(max(J1))*mu;
                J2   = J1.*(J1>=mu); %Quita los valores menores de 4
                J3=(J1<mu);
                J1=J2+J3;
                J1(:,end) = []; %Quita ultima columna
                J1=J1';
                k1perm=J1*0+1; % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) (5*pi^2-1)*u;
                u0=@(x,y) sin(2*pi*x).*sin(pi*y);      %Inicial_condition
            case 2
                Medium='Juan_Dam';
                %new_perm_o;
                newperm3; 
                %newperm2;
                %new_perm_3;
                k1perm=fliplr(k); % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) -u.*(1-u).*(1+u);    %Source
                u0=@(x,y) x.*(1-x).*y.*(1-y); %Inicial condition
            case 3
                Medium='J_Dam';
                newperm2_2 % newperm2
                k1perm=k; % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
            case 4
                Medium='Exact';
                load('Juan1','A');
                J1=A;
                J1(:,end) = []; %Quita ultima columna
                k1perm=J1*0+1; % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) (5*pi^2-1)*u;                %Source
                u0=@(x,y) sin(2*pi*x).*sin(pi*y);      %Inicial_condition
            case 5
                Medium='Fractal';
                new_medium_frac;
                %newperm3; % newperm2
                k1perm=fliplr(k); % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) -u.*(1-u).*(1+u);    %Source
                u0=@(x,y) x.*(1-x).*y.*(1-y); %Inicial condition
            case 6
                Medium='Kxx_48';
                A= importdata('Kxx_48.dat');
                J1=A;
                J1=(mu-1).*((J1-min(min(J1)))/(max(max(J1))-min(min(J1))))+1;
                J2=J1;
                J2(:,101:end) = []; %Quita ultima columna
                J3=J1(:,101:200);
                %J1=J1';
                
                k1perm=[J2;J3]; % newperm2 k1perm=k'
                k1perm(101:end,:)=[];
                k1perm=k1perm';
                k1perm(1:10,:)=1;
                k1perm(91:100,:)=1;
                k1perm(:,1:10)=1;
                k1perm(:,91:100)=1;


                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) -u.*(1-u).*(1+u);    %Source
                u0=@(x,y) x.*(1-x).*y.*(1-y); %Inicial condition

        end
        
        
        
        %         mu=10^((exponent-1));
        %         newperm2 % newperm2
        %         k1perm=k; % newperm2 k1perm=k'
        
        max_it=2000;tol=1e-6;
        ax=0;bx=1;ay=0;by=1;
        Nx=10; Ny=Nx;
        nx=10; ny=nx;
        LIM=[0,1,0,1];
        Matrix_error=[];
        
        %u0=@(x,y) x.*(1-x).*y.*(1-y);      %Inicial_condition
        %%%Allen_Cahn_equation%%%%
        %ep=0.05;
        %AC1=@(x,y) tanh(3/ep*(((2*x-3/2).^2)+(2*y-1).^2-0.39^2));
        %AC2=@(x,y) tanh(3/ep*((2*y-1).^2-0.15^2));
        %AC3=@(x,y) tanh(3/ep*(((2*x-1/2).^2)+((2*y-1).^2)-(0.25^2)));
        
        % u0=@(x,y)  1-(AC1(x,y).*(x>0.57)+ AC3(x,y).*(x<0.35)+ AC2(x,y).*((x<=0.57)&(x>=0.35)));
        
        
        
        
        CsolFine=0;
        Tant=-1;
        for add=[4]
            
            [dom,dom_ov,b,bnew,xd]=maintwoB(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol,add);
            xdir=b*0;
            pold=b*0;
            
            nv=(Nx*nx+1)*(Ny*ny+1);
            
            finematrix
            matrixR
            
            Iteration_Methods;
            Exact=ExactFD;
            Error_GMsFEM_EI_FD;
            
        end
        graphic_solutions_new
        GraphicError
        exportgraphics(f3,['figure\FD_Err_',type_problem,'_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_T=',num2str(T),'_nt=',num2str(N_steps),'.pdf'],'ContentType','vector')
        exportgraphics(f4,['figure\EI_Err_',type_problem,'_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_T=',num2str(T),'_nt=',num2str(N_steps),'.pdf'],'ContentType','vector')
        plot_coefficient_coarseM_v2
    end
end


