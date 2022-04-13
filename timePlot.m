function timePlot(x,fs,xName, semilogMode)
% Plots samples with given fs in time domain.
% Also takes name of data.
    t = linspace(0, length(x)/fs,length(x));
    
    if (semilogMode == 0)
        plot(t,x)    
    else if (semilogMode == 1)
        semilogx(t,x)
        end
    end
    
    title(xName)
    xlabel("Time [s]")
    ylabel("Amplitude []")
    xlim("tight")
    ylim("tight")
    %legend(xName,"Location","best")
    grid on
end