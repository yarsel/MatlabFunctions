function sinusUpsampler(sinusfs,Fs, L, soundMode)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    %% Part 1
    n = 0:Fs-1; % 1 sec. of signal
    x = sin(2*pi*sinusfs/Fs*n);

    figure;
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
    
    %% Upsample to 9 kHz by L=3
    Fs = Fs*L;
    xup = zeros(1, length(n)*L);
    xup(1:L:length(xup)) = x*L; % Compensate for attenuation

    figure;
    plot(abs(fft(xup))/(length(xup)/2)); % Scaled with length
    xlabel("m");
    ylabel("Amplitude []");
    title("Upsampled amplitude spectra (f="+sinusfs+"kHz, fs="+Fs+"kHz)");
    xlim("tight");
    ylim("tight");
    grid on;

    if (soundMode == 1)
        sound(xup,Fs)
    end
    
    %% Moving average filter 
    b=[1 1 1]/3;
    freqz(b,1);
    y = filter(b,1,xup);
    
    figure;
    plot(y(1:100), '.');
    xlabel("m");
    ylabel("Amplitude []");
    title('Sinus upsampled and filtered with MA');   
    xlim("tight");
    ylim("tight");
    grid on;

    if (soundMode == 1)
        sound(y,Fs)
    end
    
    %% Filter after upsampling
    figure;
    plot(abs(fft(y))/(length(y)/2)) % Scaled with length
    xlabel("m");
    ylabel("Amplitude []");
    title("Amplitude spectra with low pass filter (MA, f="+sinusfs+"kHz, fs="+Fs+"kHz)");   
    xlim("tight");
    ylim("tight");
    grid on;

    %% Upsample to Fs*M, keep same values
    xup = zeros(1,length(n)*L);
    xup(1:L:length(xup)) = x;
    xup(2:L:length(xup)-1) = x(1:end);
    xup(3:L:length(xup)-2) = x(1:end-1);
    
    figure;
    plot(xup(1:100), '.');
    xlabel("m");
    ylabel("Amplitude []");
    title("First plot");   
    xlim("tight");
    ylim("tight");
    grid on;
    
    xup = xup*L;
    
    figure;
    plot(abs(fft(xup))/(length(xup)/2)) % Scaled with length
    xlabel("m");
    ylabel("Amplitude []");
    title("Upsampled amplitude spectra - same values (f="+sinusfs+"kHz, fs="+Fs+"kHz)");   
    xlim("tight");
    ylim("tight");
    grid on;
    
    if (soundMode == 1)
        sound(xup,Fs)
    end
end

