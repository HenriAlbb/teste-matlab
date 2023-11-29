function resp = cinematicaInversa()

    %clc;

     m = [1 0 0 9;...
        0 1 0 0;...
        0 0 1 0;...
        0 0 0 1];

     m = [0.866 0.5 0 -3.1245;...
        -0.5 0.866 0 9.1674;...
        0 0 1 0;...
        0 0 0 1];

     m = [0.5 -0.866 0 7.5373;...
        0.866 0.6 0 3.9266;...
        0 0 1 0;...
        0 0 0 1];

     m = [0 1 0 -3;...
        -1 0 0 2;...
        0 0 1 0;...
        0 0 0 1];

    disp(m);

    x = m(1, 4);
    y = m(2, 4);
    z = 0;
    cosFi = m(1, 1);
    fi = acosd(cosFi);
    disp(fi);

    

    l1 = 4;
    l2 = 3;
    l3 = 2;

    xL = x - l3*cos(fi);
    yL = y - l3*sin(fi);

    cosTheta2 = (x^2 + y^2 - (l1)^2 - (l2)^2)/(2*l1*l2);
    sinTheta2 = sqrt(1 - (cosTheta2)^2);

    disp(cosTheta2);
    disp(sinTheta2);

    theta2 = atan2d(sinTheta2, cosTheta2);

    k1 = l1 + l2*cosd(theta2);
    k2 = l2*sind(theta2);

    theta1 = atan2d(y, x) - atan2d(k2, k1);
    theta3 = fi - (theta1 + theta2);

   

    resp = [theta1, theta2, theta3];
    disp(resp);

    r = rotacional(theta1, theta2, theta3)

    disp(r);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %x = 0;
    %y = .45;
    %z = 0;
    %l1 = 0.3;
    %l2 = 0.2;
    %l3 = 0.25;

    D = (x^2 + y^2 + (z - l1)^2 - l2^2 - l3^2)/(2*l2*l3);
    theta1c = atan2d(y, x);
    theta3c = atan2d(sqrt(1+D^2), D);
    theta2c = atan2d(z-l1, sqrt(x^2 + y^2)) - atan2d(l3*sind(theta3c), l2+l3*cosd(theta3c));

    %resp = [theta1c, theta2c, theta3c];


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   

    
    theta1g = atan2d(y, x) + acosd((x^2 + y^2 + l1^2 - l2^2)/(2*l1*sqrt(x^2 + y^2)));
    theta2g = acosd((x^2 + y^2 - l1^2 - l2^2)/(2*l1*l2));
    theta3g = fi - (theta1g + theta2g);

    %resp = [theta1g, theta2g, theta3g];

end

