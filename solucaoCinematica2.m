function solucaoCinematica2()

    syms theta1 theta2 theta3 L1 L2 L3;


    %% Transformação individual:
    T01 = transMatrix(0, 0, 0, theta1);
    T12 = transMatrix(0, L1, 0, theta2);
    T23 = transMatrix(0, L2, 0, theta3);
    
    %% A transformação da matriz entre
    %% frame(0) e frame (3)
    T03 = simplify(T01*T12*T23);
    %% Posição do end-effector
    P3E = [L3, 0, 0]';
    P0E = T03*[P3E;1];

    disp(P3E);
    disp(P0E);
    
end

