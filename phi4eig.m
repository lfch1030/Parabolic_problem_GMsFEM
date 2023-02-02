function phi1 = phi4eig(A,M,dt)

    [Q2,D1]=eig(full(-dt*A),full(M));
    for i=1:size(D1,1)
        D2(i,i)=1/(D1(i,i))*(exp(D1(i,i))-1);
    end
    MatQ=Q2'*M*Q2;
    DMatQ=diag(1./diag(MatQ));
    Q3=Q2*DMatQ;
    phi1=Q2*D2*Q3'; 

end