subplot(2,2,1)
plot_vector(uALL, dom,Nx,Ny,mu,k');view(2)
subplot(2,2,2)
plot_vector(uhLf, dom,Nx,Ny,mu,k');view(2)
subplot(2,2,3)
plot_vector(uALL-uhLf, dom,Nx,Ny,mu,k');view(2)
%subplot(2,2,4)
%plot_vector(z02C, dom,Nx,Ny,mu,k');view(2)