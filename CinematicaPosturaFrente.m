function CinematicaPosturaFrente(theta1, theta2, theta3)

    L1 = 4;
    L2 = 3;
    L3 = 2;

    %% Transformação individual:
    T01 = transMatrix(0, 0, 0, theta1);
    T12 = transMatrix(0, L1, 0, theta2);
    T23 = transMatrix(0, L2, 0, theta3);
    
    %% A transformação da matriz entre
    %% frame(0) e frame (3)
    T03 = T01*T12*T23;

    disp(T03);

    syms theta1 theta2 theta3 L1 L2 L3;


    %% Transformação individual:
    T01 = transMatrix(0, 0, 0, theta1);
    T12 = transMatrix(0, L1, 0, theta2);
    T23 = transMatrix(0, L2, 0, theta3);
    
    %% A transformação da matriz entre
    %% frame(0) e frame (3)
    T03 = simplify(T01*T12*T23);

    disp(T03)
    
    
end

