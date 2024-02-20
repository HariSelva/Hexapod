% Used to determine the 4 coordinates that make up the forward path of a
% leg
function path = forwardPathCoordinates(stepLength, leg_origin)
    global thetas;

    path = zeros(4, 4);
    path(:, 1) = leg_origin;
    path(:, 2) = leg_origin + [0; stepLength/2; 0; 0];
    path(:, 3) = leg_origin + [0; 0; -leg_origin(3); 0];
    path(:, 4) = leg_origin + [0; -stepLength/2; 0; 0];
end