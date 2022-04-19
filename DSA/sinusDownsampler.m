function sinusDownsampler(sinusfs, Fs, M, soundMode)
%UNTITLED2 Summary of this function goes here
%   Takes a sinuswave as input

    %% Generate signal
    n = 0:Fs-1; % 1 sec. of signal
    x = sin(2*pi*sinusfs/Fs*n);
    
    plot(abs(fft(x))/(length(x)/2)); % Scaled with length
    xlabel("m");
    ylabel("Amplitude []");
    title("Amplitude spectra (f="+sinusfs+"kHz, fs="+Fs+"kHz)");
    xlim("tight");
    ylim("tight");
    grid on;
    
    if (soundMode == 1)
        soundsc(x, Fs);
    end
    %% Downsample
    xdown = x(1:M:length(x));
    Fs = Fs / M;
    figure;
    plot(abs(fft(xdown))/(length(xdown)/2)); % Scaled with length
    xlabel("m");
    ylabel("Amplitude []");
    title("Downsampled amplitude spectra (f="+sinusfs+"kHz, fs="+Fs+"kHz)");
    xlim("tight");
    ylim("tight");
    grid on;
    
    if (soundMode == 1)
        soundsc(xdown,Fs);
    end
end

