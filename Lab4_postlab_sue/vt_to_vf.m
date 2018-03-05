function [freq, magdb] = vt_to_vf(time, signal)
%VT_TO_VF Approximates the Fourier Series of a signal with the output in dB.
%   Calculates the magnitude of the FFT of a signal. The input should contain 
%   two vectors, "time" and "signal," of the same length. The signal should 
%   represent multiple periods of a periodic signal to simulate the frequency 
%   components of the Fourier Series. The ouputs of the function are two 
%   vectors, "freq" and "magdb," containing the frequency vector and the
%   magnitude of the Fourier components in dB (20*log10(magnitude)).

% D.E. Kotecki - 29 January 2018

%% check to ensure lengths are the same
if (length(time) ~= length(signal))
    disp('Error: the "time" and "voltage" vectors do not have');
    disp('   the same length');
    return
end

%% Calculate FFT
time_even=linspace(time(1),time(end),10000); % create evenly spaced time vector with 10000 elements
signal_even=interp1(time,signal,time_even); % interpolate to obtain the voltage values
vf=fft(signal_even); % absolute value of normalized FFT
L = length(vf); 
vf=abs(vf/L);
vf=vf(1:L/2+1); % convert to single-sided function
vf(2:end-1)=2.*vf(2:end-1); % and normalize
magdb = 20.*log10(vf); % convert to dB

%% Generate frequency scale
DeltaT=time_even(5)-time_even(4); 
Fs=1/DeltaT;
freq = Fs.*(0:L/2)/L;

end