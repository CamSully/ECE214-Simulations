% Lab 5 prelab: Two-op amp oscillator circuit. Transient analysis.

addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_Lab5_prelab.hspc';

hspc_addline('.tran 10u 125m 25m', hspc_filename);
ngsim(hspc_filename); % run NGspice

% load simulation results and extract time, Vout, and Vin
data = loadsig('simrun.raw');
time = evalsig(data, 'TIME');
vout1 = evalsig(data,'vout1');
vout2 = evalsig(data, 'vout2');

% plot Vin and Vout as a function of time
fs = 16; % define font size
lw = 1.5; % define linewidth
Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location

subplot(2,1,1); % first subplot
plot(time.*1000,  vout1, 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
title('Oscillator outputs (time domain)'); % title
legend('Vout1 (Schmitt)'); % add legend
axis([30 32 0 10]); % set axis limits

% min(vout)
% max(vout)
% dc_offset = (min(vout) - max(vout)) / 2
% vout = vout - dc_offset;

subplot(2,1,2); % second subplot
plot(time.*1000, vout2, 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
xlabel('Time (ms)', 'fontsize', fs); % label x-axis
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
legend('Vout2 (integrator)'); % add legend
axis([30 32 0 10]); %set axis limits