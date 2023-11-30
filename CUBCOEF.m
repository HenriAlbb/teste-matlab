function cc = CUBCOEF(th0, thf, thdot0, thdotf)
    t0 = 0;
    tf = 10;

    a0 = th0;
    a1 = thdot0;
    a2 = (3/tf^2)*(thf - th0) - (2/tf)*th0 -(1/tf)*thdotf;
    a3 = -(2/tf^3)*(thf - th0) + (1/tf^2)*(thdotf + thdot0);

    cc = [a0 a1 a2 a3];
    
end

