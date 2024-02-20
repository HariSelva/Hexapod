% Used to test whether the kinematics was correct and that both the forward
% and inverse agree with each other
function testKinematics(x, y, z, leg)
    angles = inverseKinematics(x, y, z, leg)
    q1 = deg2rad(angles(1)) - pi/2;
    q2 = deg2rad(angles(2)) - pi/2;
    q3 = deg2rad(angles(3)) - pi/2;

    position = forwardKinematics('', q1, q2, q3)
    ax = position(1);
    ay = position(2);
    az = position(3);
    
    tol = 0.005;
    if abs(ax-x) < tol && abs(ay-y) < tol && abs(az-z) < tol
            fprintf("Correct")
        else
            fprintf("Wrong")
    end
end