function transMatrix2()

    theta1 = 10;
    theta2 = 20;
    theta3 = 30;
    L1 = 4;
    L2 = 3;
    L3 = 2;

    T01 = transMatrix(0, 0, 0, theta1);
    T12 = transMatrix(0, L1, 0, theta2);
    T23 = transMatrix(0, L2, 0, theta3);
    
    T03 = T01*T12*T23;

    disp(T03);

end

