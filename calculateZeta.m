% Calculates zeta
% OS = % Overshoot
function zeta = calculateZeta(OS)
    zeta = (-log(OS/100)) / (((pi^2 + log(OS/100)^2))^(1/2));
end