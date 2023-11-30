function gerarTrajetoria()

    m = CUBCOEF(10, 10, 10, 10);

    t = 0;
    duracao = 3;

    theta_t = m(1) + m(2)*t + m(3)*(t^2) + m(4)*(t^4);
    thetadot_t = m(2) + 2*m(3)*t + 3*m(4)*(t^2);
    thetadotdot_t = 2*m(3) + 6*m(4)*t;

    disp(theta_t);

end

