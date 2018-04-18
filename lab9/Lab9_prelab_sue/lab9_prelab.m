addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
% close all;
hspc_filename = 'lab9_prelab.hspc';

%% Transient analysis
hspc_addline('.tran 100e-4 250e-3 100e-3', hspc_filename);
ngsim(hspc_filename);
data = loadsig('simrun.raw');

time = evalsig(data, 'TIME');
Vout = evalsig(data, 'vout');

fs = 16; % define font size
lw = 1.5; % define linewidth

%% Output voltage graph
figure('Position', [100, 75, 850, 600]);
plot(time.*1000, Vout, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
title('DC-DC Converter Output Voltage');
ylabel('Voltage, V');
xlabel('Time, ms');
legend('Vout');