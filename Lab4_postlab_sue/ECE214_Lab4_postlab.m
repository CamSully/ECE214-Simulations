% Matlab m-file for ECE 214 Lab #4

addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_Lab4_postlab.hspc';

%% Define variables, specify NGspice control statement, and run NGspice

hspc_addline('.tran 10u 125m 25m', hspc_filename);
ngsim(hspc_filename); % run NGspice

% load simulation results and extract time, Vout, and Vin
data = loadsig('simrun.raw');
time = evalsig(data, 'TIME');
vout = evalsig(data,'vout');
vin = evalsig(data, 'vin');

% plot Vin and Vout as a function of time
fs = 16; % define font size
lw = 1.5; % define linewidth
Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location

subplot(2,1,1); % first subplot
plot(time.*1000,  vin, 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
title('Op Amp Input & Output (time domain)'); % title
legend('Input Voltage'); % add legend
axis([30 35 -2 2]); % set axis limits

% min(vout)
% max(vout)
% dc_offset = (min(vout) - max(vout)) / 2
% vout = vout - dc_offset;

subplot(2,1,2); % second subplot
plot(time.*1000, vout, 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
xlabel('Time (ms)', 'fontsize', fs); % label x-axis
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
legend('Output Voltage'); % add legend
axis([30 35 0 10]); %set axis limits

% Calculate the gain and phase shift
vin_peak = max(vin);
vout_peak = max(vout);

vin_zero = [ ]; % Define empty array to calculate the zero crossings for Va 
vout_zero = [ ]; % Define empty array to calculate the zero crossings for Vb

for index = 1:length(vin)-1 % calculate the zero-crossings of Va for the rising edge
    if(vin(index) < 0 && vin(index+1) > 0)
        slope = (vin(index+1) - vin(index)) / (time(index + 1) - time(index));
        vin_zero(end+1) = time(index) - vin(index)./slope;
    end
end

for index = 1:length(vout)-1 % calculate the zero-crossings of Vb for the rising edge
    if(vout(index) < 0 && vout(index+1) > 0)
        slope = (vout(index+1) - vout(index)) / (time(index + 1) - time(index));
        vout_zero(end+1) = time(index) - vout(index)./slope;
    end
end

if vin_zero(1) >= vout_zero(1)
    DeltaT = vout_zero(3) - vin_zero(2); % time shift
else
    DeltaT = vout_zero(3) - vin_zero(3); % time shift
end
PS = 360 .* DeltaT .* 1e3 ; % calculate the phase shift in degrees (PS = 360 * dt * f)

t1 = sprintf('Vin peak = %0.3g V \n',vin_peak);
t2 = sprintf('Vout peak = %0.3g V \n',vout_peak);
t3 = sprintf('Gain = %0.3g \n', vout_peak / vin_peak);
t4 = sprintf('PS = %0.3g ^{o}',PS);
text=[t1 t2 t3 t4];
dim = [.15, .7 .2 .2];
annotation('textbox',dim,'String',text,'FitBoxToText','on', 'BackgroundColor','white', 'FaceAlpha',0.8,'fontsize', 16);

%% Plot the FFT (Approximate Fourier Series)
% Fig2 = figure('Position', [150, 75, 850, 600]); % figure size and location
% 
% subplot(2,1,1);
% [freq, mag_in] = vt_to_vf(time, Vin); % generate Fourier components
% semilogx(freq, mag_in, 'linewidth', lw);
% grid on;
% set(gca, 'fontsize', fs);
% axis([100,1e5,-30,10]); % set axis limits
% legend('Filter Input'); % add legend
% ylabel('Voltage (dB)', 'fontsize', fs); % label y-axis
% title('ECE 214: Lab 3 - Low Pass Filter (Fourier components of square wave)')
% 
% subplot(2,1,2);
% [freq, mag_out] = vt_to_vf(time, Vout); % generate Fourier components
% semilogx(freq, mag_out, 'linewidth', lw);
% grid on;
% set(gca, 'fontsize', fs);
% axis([100,1e5,-40,10]);
% legend('Filter Output'); % add legend
% ylabel('Voltage (dB)', 'fontsize', fs); % label y-axis
% xlabel('Frequency (Hz)', 'fontsize', fs); % label x-axis

%% Frequency response of op amp (ac analysis)
% 
% hspc_addline('.ac dec 200 100 1e6', hspc_filename); % change from transient to ac analysis
% ngsim(hspc_filename); % run NGspice
% 
% %% Load simulation results and extract Frequency and Vout
% data = loadsig('simrun.raw');
% frequency = evalsig(data, 'FREQUENCY');
% vout = evalsig(data,'vout');
% vin = evalsig(data,'vin');

%% Plot amplitude and phase

% Fig3 = figure('Position', [100, 75, 850, 600]);
% 
% subplot(2,1,1)
% semilogx(frequency, abs(vout/vin), 'linewidth',lw);
% grid on;
% set(gca, 'fontsize', fs);
% ylabel('Gain (V/V)', 'fontsize', fs);
% title('Op Amp (frequency response)');
% legend('Gain'); % add legend
% 
% subplot(2,1,2)
% semilogx(frequency, phase(vout)*180/pi, 'linewidth',lw);
% grid on;
% set(gca, 'fontsize', fs);
% xlabel('Frequency (Hz)', 'fontsize', fs);
% ylabel('Phase (degrees)', 'fontsize', fs);
% legend('Op Amp Output'); % add legend

%% end of M file