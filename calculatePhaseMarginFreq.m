% Calculates Phasemargin-frequency
% zeta = zeta for transfer function
% Ts = Settling time
function w_bw = calculatePhaseMarginFreq(zeta, Ts)
    w_bw = (4/(Ts*zeta)) * (sqrt((1-(2*zeta^2))+sqrt((4*zeta^4) - (4*zeta^2) + 2)));
end