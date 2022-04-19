function [G_PI, PI] = calculateG_PI(w_bw, G_Kp)
    s = tf('s');
    Ti = 20/w_bw;
    PI = (((s * Ti) + 1) / (s * Ti));
    G_PI = G_Kp * PI;
end