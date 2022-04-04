% Calculates Phasemargin
% zeta = zeta for transfer function
function phase_margin = calculatePhaseMargin(zeta)
    phase_margin = atan((2*zeta) / (-2*zeta^2 + (1+(4*zeta^4))^(1/2))^(1/2));
    phase_margin = rad2deg(phase_margin);
end