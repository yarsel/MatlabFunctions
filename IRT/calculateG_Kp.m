function [G_Kp, Kp] = calculateG_Kp(G,w_bw)
    [mag,phase,wout] = bode(G,w_bw);
    Kp = abs(mag2db(mag)); % make positiv dB
    Kp = db2mag(Kp);
    G_Kp = G * Kp;
end