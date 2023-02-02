function Sol_exac = Ref_Sol_Exact(T,LIM,mx,my)
    
    
    u0=@(x,y) exp(-T)*sin(2*pi*x).*sin(pi*y);
    Sol_exac=u0(mx,my);
end