% Matlab m-file for ECE 214 Lab #4 - Schmitt Trigger

addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_Lab4_prelab2.hspc';

%% Define variables, specify NGspice control statement, and run NGspice
hspc_addline('.dc V0 0 10 .1', hspc_filename); % DC sweep from 0 to 10 V
ngsim(hspc_filename); % run NGspice

%% load simulation results and extract time, Vout, and Vin
data = loadsig('simrun.raw');
Vin = evalsig(data, 'VOLTAGE');
Vout = evalsig(data,'vout');

%% plot Vin and Vout as a function of time
fs = 16; % define font size
lw = 1.5; % define linewidth

Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location
plot(Vin, Vout,'linewidth',lw);
hold on
plot(Vin(1:4:end), Vout(1:4:end), 'b>', 'MarkerSize', 12);
set(gca, 'fontsize', fs); % set font size
ylabel('Output Voltage (V)', 'fontsize', fs); % label y-axis
xlabel('Input Voltage (V)', 'fontsize', fs); % label x-axis
title('ECE 214: Lab 4 - Schmitt Trigger'); % title
grid on; % add grid

%% NGspice control statement and run NGspice
hspc_addline('.dc V0 10 0 -.1', hspc_filename); % DC sweep from 10 to 0V
ngsim(hspc_filename); % run NGspice

%% load simulation results and extract time, Vout, and Vin
data = loadsig('simrun.raw');
Vin = evalsig(data, 'VOLTAGE');
Vout = evalsig(data,'vout');

%% Plot result on the same graph
plot(Vin, Vout, 'linewidth',lw);
plot(Vin(1:4:end), Vout(1:4:end), 'r<', 'MarkerSize',12);
%% end of M file
