%% Matlab m-file Template for ECE 214 Lab #1 (Post-Lab Part A)
% In this example, we will plot the two functions:
%     exp^(-at)
% and 
%     exp^(-at) * cos(wt - 90 degrees)
% on both a linear and semi-logarithmic graph

%% Clear variables and define variables
clear variables; % clear all variables
a = 130; % define variable 'a'
w = 2.*pi.*1000; % define variable 'w'
Tlog = logspace(1, 7, 300);  % create a logarithmic time vector 'Tlog' between 10u and 10m

%% Define functions
V1a = exp(-a.*Tlin); % first function 'V1' with a linear time scale
V1b = exp(-a.*Tlog); % first function 'V1' with a logarithmic time scale
legendname1 = 'Node Voltage V1'; % legend name for first function

V2a = exp(-a.*Tlin) .* cos(w.*Tlin - pi/2); % second function 'V2' with a linear time scale 
V2b = exp(-a.*Tlog) .* cos(w.*Tlog - pi/2); % second function 'V2' with a logarithmic time scale
legendname2 = 'Node Voltage V2'; % legend name for second function

%% Plot on a semilog-x scale
FigHandle = figure('Position', [150, 75, 850, 600]); % create 2nd figure and set size and location
semilogx(Tlog, V1b, '-^', 'markersize', 3, 'linewidth',1.2, 'displayname', legendname1);
hold on; % hold on for multiple plots
semilogx(Tlog, V2b, '-o', 'markersize', 3, 'linewidth',1.2, 'displayname', legendname2);
grid on; % turn on grid
set(gca, 'fontsize', 16); % set font size
legend show % show legend
xlabel('Time (s)'); % label x-axis
ylabel('Voltage (V)'); % label y-axis
title('Semilog plot of V1 and V2 as a function of time'); % add title

%% End of .m file