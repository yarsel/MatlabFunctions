% function description:
% G = Transfer function
% Ts = Settlingtime
% OS = Max % Overshoot
% plotMode = If 0, do not make plots except stepresponse. 
%          = If 1, do all plots
function PIDSolver(G, Ts, OS, plotMode)
    % Step: Init
    s = tf('s');
        

    % Step: Find: zeta, %OS, phasemargin and phasemargin-frequency
    %% Calculate zeta from %OS
    zeta = calculateZeta(OS)

    %% Calculate overshoot
    OS = calculateOS(zeta)

    %% Calculate phasemargin
    phase_margin = calculatePhaseMargin(zeta)
    
    %% Calculate phasemargin-frequency
    w_bw = calculatePhaseMarginFreq(zeta, Ts)


    % Step: Make Kp
    [G_Kp, Kp] = calculateG_Kp(G,w_bw)

    % Step: Make G_PD part
    [G_PD, PD] = calculateG_PD(w_bw, G_Kp)
    
    % Step: Make G_PI part
    [G_PI, PI] = calculateG_PI(w_bw, G_Kp)


    % Step: Make openloop plot of system after all filters
    G_All = G_Kp + (G_PD) + (G_PI);

    
    % Step: Final, Make stepresponse
    stepResponse(G_All)

    % Step: Plot
    if (plotMode == 1)
        bodePlot(G,"Bodeplot for G(s)");
        
        bodePlot(G_Kp,"Bodeplot for G(s) * Kp");
        bodePlot(G_PD, "Bodeplot for G_PD(s)");
        bodePlot(G_PI, "Bodeplot for G_PI(s)");

        bodePlot(G_All,"Bodeplot after applying G_PD and G_PI to G(s)");
    end
end