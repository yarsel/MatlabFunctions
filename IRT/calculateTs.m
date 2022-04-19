function Ts = calculateTs(w_n, zeta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    s = tf('s');
    %Ts = (w_n^2) / ((s^2) + (2*zeta*w_n*s) + (w_n^2));
    syms Ts;
    Ts = solve (w_n == (4/(Ts*zeta)) * (sqrt((1-(2*zeta^2))+sqrt((4*zeta^4) - (4*zeta^2) + 2))), Ts);
    Ts = round(Ts,4);
end

