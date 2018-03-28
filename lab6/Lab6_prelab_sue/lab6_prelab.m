addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
close all;
hspc_filename = 'lab6_prelab.hspc';

% Frequency analysis: 201 points from 1KHz to 500KHz
hspc_addline('.ac dec 201 1e3 500e3', hspc_filename);
% Transient analysis: 
% hspc_addline('.tran 1n 200e-6 250e-6', hspc_filename);
ngsim(hspc_filename); % run NGspice

%% Load simulation results and extract Frequency and Vout
data = loadsig('simrun.raw');
frequency = evalsig(data, 'FREQUENCY');
% time = evalsig(data, 'TIME');
Vc = evalsig(data,'vc');
Vin = evalsig(data, 'vin');
Vfg = evalsig(data, 'vfg');

fs = 16; % define font size
lw = 1.5; % define linewidth

% figure('Position', [100, 75, 850, 600]);
% plot(time.*1000000, Vc, 'linewidth',lw);
% title('RLC Circuit Transient Responses');
% grid on;
% 
% ylabel('Voltage');
% xlabel('Time, us');
% hold on;
% plot(time.*1000000, Vin, 'linewidth',lw);
% grid on;
% legend('Vin');
% ylabel('Voltage');
% xlabel('Time, us');
% hold on;
% plot(time.*1000000, Vfg, 'linewidth',lw);
% grid on;
% ylabel('Voltage, V');
% xlabel('Time, us');
% set(gca, 'fontsize', fs);
% legend('Vc', 'Vin', 'Vfg');
% 
% figure('Position', [100, 75, 850, 600]);
% plot(time.*1000000, Vin-Vc, 'linewidth',lw);
% title('Inductor Voltage Transient Response');
% ylabel('Voltage, V');
% xlabel('Time, us');
% set(gca, 'fontsize', fs);
% legend('VL');

%% Vin and Vc voltage plots

Fig1 = figure('Position', [100, 75, 850, 600]);

% Vin = ones(size(frequency)) * 20*log10(1);
subplot(2,1,1)
semilogx(frequency, 20.*log10(Vin), 'linewidth',lw);
title('RLC Circuit Frequency Response');
grid on;
set(gca, 'fontsize', fs);
ylabel('Voltage (dB)', 'fontsize', fs);
legend('Vin'); 

subplot(2,1,2)
semilogx(frequency, 20.*log10(abs(Vc)), 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
ylabel('Voltage (dB)', 'fontsize', fs);
legend('Capacitor Voltage'); 

%% Vl voltage plot

% Inductor voltage
Vl = Vin - Vc;
VldB = 20.*log10(abs(Vin - Vc));
figure('Position', [100, 75, 850, 600]);
semilogx(frequency, VldB, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
title('RLC Circuit Inductor Frequency Response');
xlabel('Frequency (Hz)', 'fontsize', fs);
ylabel('Voltage (dB)', 'fontsize', fs);
legend('Inductor Voltage');

%% Vin and Vc Phase plots

figure('Position', [100, 75, 850, 600]);
subplot(2,1,1)
semilogx(frequency, phase(Vin).*180/pi, 'linewidth',lw);
title('RLC Circuit Phase Response');
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
title('RLC Circuit Inductor Phase Response');
grid on;
set(gca, 'fontsize', fs);
xlabel('Frequency (Hz)', 'fontsize', fs);
ylabel('Phase (degrees)', 'fontsize', fs);
legend('VL Phase');

%% Phase shift plot
figure('Position', [100, 75, 850, 600]);
PS = (phase(Vin).*180/pi) - (phase(Vc).*180/pi);
semilogx(frequency, PS, 'linewidth',lw);
title('Phase shift (Vin-Vc)');
grid on;
set(gca, 'fontsize', fs);
xlabel('Frequency (Hz)', 'fontsize', fs);
ylabel('Phase (degrees)', 'fontsize', fs);
legend('VL Phase');

%% Transient equations

% Vs = 1;
% R = 50;
% L = 1e-3;
% alpha = 25e3;
% wd = 49e3;
% t = 40e-6;
% 
% vct = Vs - (R*Vs)/(L*wd)*exp(-alpha*t)*sin(wd*t) - (Vs/wd)*(-alpha*exp(-alpha*t)*sin(wd*t)+wd*exp(-alpha*t)*cos(wd*t))
% vlt = (Vs/wd)*(-alpha*exp(-alpha*t)*sin(wd*t)+exp(-alpha*t)*wd*cos(wd*t))