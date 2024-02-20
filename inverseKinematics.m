% Uses inverse kinematics to take the position (x, y, z) to determine the
% three angles
function angles = inverseKinematics(x, y, z, leg)
    % Retrieve the global constants
    global baseToCoxa;
    global coxaToFemur;
    global femurToTibia;
    global tibiaToEnd;
    global thetas;

    % Rotates  the leg so that the position is at leg 1 and then translate
    % it so that it is at the Coxa
    theta = thetas(leg);
    theta = deg2rad(theta);
    T_BaseToCoxaLeg1 = [cos(-theta), -1*sin(-theta), 0, -baseToCoxa;
                        sin(-theta), cos(-theta), 0, 0;
                        0, 0, 1, 0;
                        0, 0, 0, 1];

    P_Base = [x;
              y;
              z;
              1];

    P_CoxaLeg1 = T_BaseToCoxaLeg1 * P_Base;
    x = P_CoxaLeg1(1);
    y = P_CoxaLeg1(2);

    % Calculate Coxa angle
    q3 = atan2(y, x);

    % Rotate coordinates so that it is eequivalent to when a3=90 or q3=0
    % and then translate to the Femur
    T_CoxaToFemurLeg1 = [cos(-q3), -1 * sin(-q3), 0, -coxaToFemur;
                         sin(-q3), cos(-q3), 0, 0;
                         0, 0, 1, 0;
                         0, 0, 0, 1];

    P_FemurLeg1 = T_CoxaToFemurLeg1 * P_CoxaLeg1;
    x = P_FemurLeg1(1);
    z = P_FemurLeg1(3);

    % Calculate intermediate valuves
    a = atan2(z, x);
    b = acos((x^2 + z^2 + femurToTibia^2 - tibiaToEnd^2) / (2*sqrt(x^2 + z^2)*femurToTibia));
    c = acos((femurToTibia^2 + tibiaToEnd^2 - (x^2 + z^2)) / (2 * femurToTibia * tibiaToEnd));
    
    % Calculate Femur and Tibia angle
    q1 = b - (-a);
    q2 = pi - c;

    % Convert to actual angles
    a1 = rad2deg(q1) + 90;
    a2 = 90 - rad2deg(q2);
    a3 = rad2deg(q3) + 90;

    angles = [a1 a2 a3];

end