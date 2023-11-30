function t_planejarTrajetoria()

    cc = [];
    s = 0.3333;
    path = [linspace(1, 10, 10); linspace(1, 10, 10)];

    disp(path);

    function CUBCOEF(th0, thf, thdot0, thdotf)
    
        cc(1) = th0;
        cc(2) = thdot0/s;
        cc(3) = 3*(thf - th0) - 2*thdot0/s -thdotf/s;
        cc(4) = -2*(thf - th0) + thdotf/2 + thdot0/2;
   
    end

    function JOINTVEL(viapnt, npnt, viavel)
        for j = 1:3:1
            viavel(1, j) = 0;
            viavel(npnt, j);
        end
        if npnt > 2
            for i = 2:npnt-1:1
                for j = 1:3:1
                    viavel(i, j) = 0.5*(viapnt(i,j) - viapnt(i-1,j) + (viapnt(i+1,j) - viapnt(i,j)*s));
                end
            end
        end
    end


    npnt = 1;

    for i = 1:npnt-1:1
        for j = 1:3:1
            CUBCOEF(viapnt(i,j), viapnt(i+1,j), viavel(i,j), viavel(i+1,j), path(i,j))
        end
    end

    %fplot(path, npnt);
    plot(path, npnt);



end

