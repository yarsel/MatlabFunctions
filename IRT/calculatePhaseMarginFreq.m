% Calculates Phasemargin-frequency
% zeta = zeta for transfer function
% Ts = Settling time
function w_bw = calculatePhaseMarginFreq(zeta, input, value)
    if (input == "Ts")
        w_bw = (4/(value*zeta)) * (sqrt((1-(2*(zeta^2)))+sqrt((4*(zeta^4)) - (4*(zeta^2)) + 2)));
    elseif (input == "Tp")
            w_bw = (pi / (value * (sqrt(1 - (zeta^2)))) * sqrt((1 - (2*(zeta^2))) + sqrt((4 * (zeta^4)) - (4 * (zeta^2)) + 2)));
    elseif (input == "Tr")
            fprintf("Sorry, no equation")       
    else
        fprintf("Error")
    end
end