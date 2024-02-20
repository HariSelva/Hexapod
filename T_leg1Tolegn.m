% Creates the rotation Matrix to rotate a leg from leg 1 to any Leg n
function rotationMatrix = T_leg1Tolegn(theta)
    theta = deg2rad(theta);
    rotationMatrix = [cos(theta), -1*sin(theta), 0, 0;
                      sin(theta), cos(theta), 0, 0;
                      0, 0, 1, 0;
                      0, 0, 0, 1];
end