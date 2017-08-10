function u = total_variation(y,G,L,T,S)
    N = size(y,1);
    M = size(y,2);
    
    u =  zeros(size(y));
    
    dx = zeros(size(y));
    dy = zeros(size(y));
    
    bx = zeros(size(y));
    by = zeros(size(y));
    for t = 1:T
        disp(t);
        [ux,uy] = gradients(u);
        
        nu = sqrt(sum((ux+bx).^2,3)+sum((uy+by).^2,3)+1e-40);
        for i = 1:N
            for j = 1:M
                dx(i,j,:) = max(nu(i,j)-1.0/G,0.0)*(ux(i,j,:)+bx(i,j,:))/nu(i,j);
                dy(i,j,:) = max(nu(i,j)-1.0/G,0.0)*(uy(i,j,:)+by(i,j,:))/nu(i,j);
            end
        end
        
        r = L*y/G-divergence(dx-bx,dy-by)-L*u/G+laplacian(u);
        p = r;
        q = L*r/G-laplacian(r);
        rtr = mean(mean(mean(r.*r)));
        for s = 1:S
            disp(s);
            disp(mean(mean(mean(r.^2))));
            ptq = mean(mean(mean(p.*q)));
            disp([ptq,rtr]);
            at = rtr / (ptq+1e-40);
            u = u + at * p;
            r = r - at * q;
            
            rtr_n = mean(mean(mean(r.*r)));
            
            bt = rtr_n / (rtr+1e-40);
            p = r + bt*p;
            q = L*p/G-laplacian(p);

            rtr = rtr_n;
        end
        [ux,uy] = gradients(u);
        bx = bx + ux - dx;
        by = by + uy - dy;
    end
end