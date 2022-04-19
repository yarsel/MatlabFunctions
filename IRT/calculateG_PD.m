function [G_PD, PD] = calculateG_PD(w_bw,G_Kp)
    s = tf('s');
    Td = 1/(w_bw/2);
    Tf = 1/(w_bw*3);
    PD = (1 + (s * Td) / (s * Tf + 1));
    G_PD = G_Kp * PD;
end