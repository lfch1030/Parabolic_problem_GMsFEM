function b = FEM_Right_Eval(LIM , S , Source , TOOLS, Ng)

if nargin == 4
   TOOLS.Ng = Ng; 
end

[px,py,wx,wy] = FEM_GaussMat(LIM(1), LIM(1)+TOOLS.dx, LIM(3), LIM(3)+TOOLS.dy ,Ng);
F   = TOOLS.F(px(:)',py(:)');
FL = kron(ones(TOOLS.NF,1),F);
FR = kron(F,ones(TOOLS.NF,1));
FF = FL.*FR;
E = speye(4);
U  = [kron(S(TOOLS.R'),E(:,1)),kron(S(TOOLS.R'),E(:,2)),kron(S(TOOLS.R'),E(:,3)),kron(S(TOOLS.R'),E(:,4))];
W  = wx.*wy;
UF = U*FF;
B_APT = Source(0,0,0,UF)*W(:);
% B_APT  =-(UF.*(UF+1).*(UF-1))*W(:);
b = sparse(TOOLS.R(:),1,B_APT);
b = b(TOOLS.Inner);

end













