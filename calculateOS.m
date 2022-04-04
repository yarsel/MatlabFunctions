% Calculates % Overshoot
% zeta = zeta for transfer function
function OS = calculateOS(zeta)
    Cmax = (1 + exp(-((zeta*pi)/sqrt(1-zeta^2))));
    OS = (Cmax-1)*100;
end