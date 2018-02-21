%% Matlab m-file template for ECE 214 Lab 1 (Post-Lab Part B)

%% Set path, clear variables, and define hspc filename
addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox'); % ngspice matlab toolbox
clear variables; % clear variables
hspc_filename = 'ECE214_2018_Lab1.hspc'; % set the hspc filename

%% Simulation control statement
hspc_addline('.tran 60u 20m', hspc_filename); % define transient simulation and write to hspc file

%% Generate N logarithmically spaced resistance values
% range is from 10 Ohms - 10 Meg Ohms
N = 10;
Rvalues = logspace(1,7,N);

%% Loop through all values of R and determine peak voltage
for i = 1:N
    hspc_set_param('res', Rvalues(i), hspc_filename); %set resistance value in Lab1.hspc
    ngsim(hspc_filename); % call ngsim and run simulation
    data = loadsig('simrun.raw'); % load simulation reults in variable 'data'
    vout = evalsig(data,'vout'); % store output voltage values in variable 'vout'
    vpeak(i) = abs(min(vout)); % calculate pleak voltage and store in array 'vpeak'
end

%% Plot
FigHandle = figure('Position', [200, 75, 850, 600]); % figure size and location
semilogx(Rvalues, vpeak, '-s', 'linewidth', 2.0) % generate semilog plot
grid on; % turn on the grid
set(gca, 'fontsize', 16); % increase font size of title and axes text
xlabel('Resistance (\Omega)', 'fontsize', 16); % label x-axis
ylabel('Output Voltage (V)', 'fontsize', 16); % label y-axis
title('Expected output voltage as a function of resistance'); % add title
grid on; % turn on grid

%% End of .m file
