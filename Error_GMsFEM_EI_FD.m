
EI_error=abs(EISOL-Exact);
FD_error=abs(FDSOL-Exact);

L2_error_r_EI=sqrt((EI_error'*M*EI_error)/(Exact'*M*Exact))*100;
L2_error_r_FD=sqrt((FD_error'*M*FD_error)/(Exact'*M*Exact))*100;

H1_error_r_EI=sqrt((EI_error'*A*EI_error)/(Exact'*A*Exact))*100;
H1_error_r_FD=sqrt((FD_error'*A*FD_error)/(Exact'*A*Exact))*100;

Matrix_error=[Matrix_error;round(add+1),L2_error_r_FD,H1_error_r_FD,L2_error_r_EI,H1_error_r_EI]

Ratio_Error=1./(Matrix_error(2:end,:)./Matrix_error(1:end-1,:))