% Plots stepsresponse and stepdata for G
% G = Transfer function (Open loop)
function result = stepResponse(G)
    result = feedback(G,1);
    fprintf("Step response of closed loop G(s):")
    figure; step(result); grid on;
    result = stepinfo(result);
end