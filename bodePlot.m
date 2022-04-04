% Plots bodePlot of G
% G = Transfer function
% name = Text to print
function bodePlot(G,name)
    fprintf("\n"+name+":\n")
    figure; bode(G); grid on;
end