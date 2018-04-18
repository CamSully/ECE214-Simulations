addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
close all;
hspc_filename = 'lab10_prelab2.hspc';

%% Transient analysis
hspc_addline('.tran 100e-4 20.2e-3 20e-3', hspc_filename);
ngsim(hspc_filename);
data = loadsig('simrun.raw');

time = evalsig(data, 'TIME');
Vout = evalsig(data, 'vout');
Vin = evalsig(data, 'vin');

fs = 16; % define font size
lw = 1.5; % define linewidth

%% Output voltage graph
% figure('Position', [100, 75, 850, 600]);
% plot(time.*1000, Vin, 'linewidth',lw);
% grid on;
% set(gca, 'fontsize', fs);
% title('Multivibrator Input Voltage');
% ylabel('Voltage, V');
% xlabel('Time, ms');
% legend('Vin');

% hold on;
figure('Position', [100, 75, 850, 600]);
plot(time.*1000, Vout, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
title('Villard Double Output Voltage');
ylabel('Voltage, V');
xlabel('Time, ms');
legend('Vout');
% 
% plot(time.*1000, Vc1, 'linewidth',lw);
% grid on;
% set(gca, 'fontsize', fs);
% ylabel('Voltage, V');
% xlabel('Time, ms');
% legend('Vin', 'Vout', 'Vc1');