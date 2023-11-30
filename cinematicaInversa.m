function CinematicaInversa()

    % MATLAB exercício 4 para projeto 3

    clc;clear all;

    m = [1 0 0 9; 0 1 0 0; 0 0 1 0; 0 0 0 1]
    %m = [0.5 -0.866 0 7.5373; 0.866 0.6 0 3.9266; 0 0 1 0; 0 0 0 1]
    %m = [0 1 0 -3; -1 0 0 2; 0 0 1 0; 0 0 0 1]
    %m = [0.866 0.5 0 -3.1245; -0.5 0.866 0 9.1674; 0 0 1 0; 0 0 0 1]

    disp(m);

    l1 = 4;
    l2 = 3;
    l3 = 2;

    wrist_frame_transform = [1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    wrist_frame = m/wrist_frame_transform
    c_phi = wrist_frame(1,1);
    s_phi = wrist_frame(2,1);
    x = wrist_frame(1,4);
    y = wrist_frame(2,4);

    cT2 = (x^2 + y^2 - (l1)^2 - (l2)^2)/(2*l1*l2);

    tol = 4*eps;
    if(abs(cT2) - 1) < tol
        sT2 = sqrt(1 - (cT2)^2);
        theta2 = [atan2d(sT2, cT2) atan2d(-sT2, cT2)];

        k1 = l1 + l2*cT2;
        k2 = l2*sT2;


        theta1 = [(atan2d(y, x) - atan2d(k2, k1)) (atan2d(y, x) - atan2d(-k2, k1))];

        phi = atan2d(s_phi, c_phi);
        theta3 = phi - (theta1 + theta2);


        fprintf('Theta1 = %3.3f, \t%3.3f\n', theta1);
        fprintf('Theta2 = %3.3f, \t%3.3f\n', theta2);
        fprintf('Theta3 = %3.3f, \t%3.3f\n', theta3);

    else
        fprintf('Não existe solução\n');
        return;
    end

    

end

