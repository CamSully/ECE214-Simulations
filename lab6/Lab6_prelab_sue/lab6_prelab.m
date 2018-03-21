addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
hspc_filename = 'lab6_prelab.hspc';

% 201 points from 100Hz to 10KHz
hspc_addline('.ac dec 201 1e3 500e3', hspc_filename); % change from transient to ac analysis
ngsim(hspc_filename); % run NGspice

%% Load simulation results and extract Frequency and Vout
data = loadsig('simrun.raw');
frequency = evalsig(data, 'FREQUENCY');
Vc = evalsig(data,'vc');

fs = 16; % define font size
lw = 1.5; % define linewidth

%% Vin and Vc plots

Fig1 = figure('Position', [100, 75, 850, 600]);

Vin = ones(size(frequency)) * 20*log10(1);
subplot(2,1,1)
semilogx(frequency, Vin, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
ylabel('Voltage (dB)', 'fontsize', fs);
legend('Vin'); 

subplot(2,1,2)
semilogx(frequency, 20.*log10(abs(Vc)), 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
ylabel('Voltage (dB)', 'fontsize', fs);
title('RLC Circuit Cap Voltage Frequency Response');
legend('Capacitor Voltage'); 

%% Vl plot

% Inductor voltage
Vl = 20.*log10(abs(1 - Vc));
figure('Position', [100, 75, 850, 600]);
semilogx(frequency, Vl, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
title('RLC Circuit Inductor Voltage Frequency Response');
xlabel('Frequency (Hz)', 'fontsize', fs);
ylabel('Voltage (dB)', 'fontsize', fs);
legend('Inductor Voltage');

%% Phase plots

figure('Position', [100, 75, 850, 600]);
subplot(2,1,1)
title('RLC Circuit Phase Response');
semilogx(frequency, phase(Vin).*180/pi, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
xlabel('Frequency (Hz)', 'fontsize', fs);
ylabel('Phase (degrees)', 'fontsize', fs);
legend('Vin Phase'); 

subplot(2,1,2)
semilogx(frequency, phase(Vc).*180/pi, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
xlabel('Frequency (Hz)', 'fontsize', fs);
ylabel('Phase (degrees)', 'fontsize', fs);
legend('Cap V Phase');

%% Vl phase plot

figure('Position', [100, 75, 850, 600]);
semilogx(frequency, phase(Vl).*180/pi, 'linewidth',lw);
title('RLC Circuit Inductor Voltage Phase Response');
grid on;
set(gca, 'fontsize', fs);
xlabel('Frequency (Hz)', 'fontsize', fs);
ylabel('Phase (degrees)', 'fontsize', fs);
legend('Vl Phase');