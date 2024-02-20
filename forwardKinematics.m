% Uses forward kinematics to determine the position of a leg, given the
% angles of the servos
function position = forwardKinematics(plane, q1, q2, q3)
    % Retrieve the global constants
    global baseToCoxa;
    global coxaToFemur;
    global femurToTibia;
    global tibiaToEnd;
    
    % Calculate and return the corresponding position values
    if plane == 'x'
        position = baseToCoxa  + (coxaToFemur + femurToTibia * cos(q1) + tibiaToEnd * cos(q1 + q2)) * cos(q3);
    elseif plane == 'y'
        position = (coxaToFemur + femurToTibia * cos(q1) + tibiaToEnd * cos(q1 + q2)) * sin(q3);
    elseif plane == 'z'
        position = femurToTibia * sin(q1) + tibiaToEnd * sin(q1 + q2);
    else % Return the full coordinate
        x = baseToCoxa  + (coxaToFemur + femurToTibia * cos(q1) + tibiaToEnd * cos(q1 + q2)) * cos(q3);
        y = (coxaToFemur + femurToTibia * cos(q1) + tibiaToEnd * cos(q1 + q2)) * sin(q3);
        z = femurToTibia * sin(q1) + tibiaToEnd * sin(q1 + q2);
        position = [x y z];
    end
end