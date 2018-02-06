%% Clear variables and define variables
clear variables; % clear all variables
r = logspace(1, 7, 1000);  % create a logarithmic time vector 'Tlog' between 10 and 10M.

% Define functions
vout1 = r./(r*2); % first function 'V1' with a linear time scale
vout2 = (r.*(150358900000000 - 150358900000000i))./(r.^2.*(258454746 - 42256169i) + r.*(300740299670000 - 300710336220000i) + (7517945000000000 - 7517945000000000i));
legendname1 = 'Vout1';
legendname2 = 'Vout2';
legendname3 = 'Measured Vout';


% Plot on a semilog-x scale
% FigHandle = figure('Position', [150, 75, 850, 600]); % create 2nd figure and set size and location
semilogx(r, vout1, 'markersize', 3, 'linewidth',4, 'displayname', legendname1);
hold on; % hold on for multiple plots
semilogx(r, vout2, 'markersize', 3, 'linewidth',2, 'displayname', legendname2);
hold on;

% Plot measured vout points.
x = [10,10e3,1e6];
y = [144e-3,500e-3,331e-3];
plot(x,y,'.','markersize',35,'displayname',legendname3);

grid on; % turn on grid
set(gca, 'fontsize', 16);
legend show
xlabel('Resistance (\Omega)');
ylabel('Voltage (V)');
title('Semilog Plot of Vout1, Vout2, and V-measured vs Resistance'); % add title