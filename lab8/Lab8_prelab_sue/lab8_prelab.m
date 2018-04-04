addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
close all;
hspc_filename = 'lab8_prelab.hspc';

%% Transient analysis
hspc_addline('.tran 1e-6 25e-3 0e-3', hspc_filename);
ngsim(hspc_filename);
data = loadsig('simrun.raw');

time = evalsig(data, 'TIME');
Vout = evalsig(data, 'vout');

fs = 16; % define font size
lw = 1.5; % define linewidth

figure('Position', [100, 75, 850, 600]);
plot(time.*1000, Vout, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
title('Oscillator Output Voltage');
ylabel('Voltage, V');
xlabel('Time, ms');
legend('Vout');