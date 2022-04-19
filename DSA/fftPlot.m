function fftPlot(x,fs, semilogMode)
% Tager fft af x og plotter resultatet.
% Tager også imod navnet på dataen.
    N = length(x);
    f_axis = [0:N-1]*fs/N;
    xFFT = abs(fft(x));
    
    if (semilogMode == 0)
        plot(f_axis, xFFT)    
    else if (semilogMode == 1)
        semilogx(f_axis, xFFT, 'red')
        end
    end

    xlim("tight")
    ylim("tight")
    xlabel("Frequency [Hz]")
    ylabel("Amplitude []")
    grid on
end