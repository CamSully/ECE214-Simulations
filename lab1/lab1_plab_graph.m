%% Clear variables and define variables
clear variables; % clear all variables
r = logspace(1, 7, 10);  % create a logarithmic time vector 'Tlog' between 10 and 10M.

% Define functions
vout1 = 1/2; % first function 'V1' with a linear time scale
vout2 = (r.*(150358900000000 - 150358900000000i))/(r.^2.*(258454746 - 42256169i) + r.*(300740299670000 - 300710336220000i) + (7517945000000000 - 7517945000000000i));
legendname1 = 'vout1';
legendname2 = 'vout2';

% Plot on a semilog-x scale
% FigHandle = figure('Position', [150, 75, 850, 600]); % create 2nd figure and set size and location
semilogx(r, vout1, '-^', 'markersize', 3, 'linewidth',1.2, 'displayname', legendname1);
hold on; % hold on for multiple plots
semilogx(r, vout2, '-o', 'markersize', 3, 'linewidth',1.2, 'displayname', legendname2);
grid on; % turn on grid
set(gca, 'fontsize', 16);
% legend show
xlabel('Resistance (ohms)');
ylabel('Voltage (V)');
title('Semilog plot of vout1 and vout2 as a function of resistance'); % add title