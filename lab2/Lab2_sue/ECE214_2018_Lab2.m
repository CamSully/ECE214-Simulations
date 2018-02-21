%% Matlab m-file Template for ECE 214 Lab #2

addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox'); % add ngspice matlab toolbox to the path
clear variables;
hspc_filename = 'ECE214_2018_Lab2.hspc';

%% Define variables and specify NGspice control statement
frequency = 40000; % frequency variable
T = 1./frequency; % define period T
ctrl_string = sprintf('.tran %0.5g %0.5g %0.5g %0.5g', 1e-3*T, 1e-3+6*T, 1e-3, 0); % define transient control statement
hspc_set_param('freq', frequency, hspc_filename); % write frequency parameter 'freq' to hspc file
hspc_addline(ctrl_string, hspc_filename);
ngsim(hspc_filename); % run NGspice

%% Load simulation results and extract time, Va, and Vb
data = loadsig('simrun.raw');
time = evalsig(data, 'TIME');
va = evalsig(data,'va');
vb = evalsig(data, 'vb');

%% Calculate peak voltages Va and Vb, and phase shift
Va_peak = max(va); % peak voltage of Va
Vb_peak = max(vb); % peak voltage of Vb

Va_zero = [ ]; % Define empty array to calculate the zero crossings for Va 
Vb_zero = [ ]; % Define empty array to calculate the zero crossings for Vb

for index = 1:length(va)-1 % calculate the zero-crossings of Va for the rising edge
    if(va(index) < 0 && va(index+1) > 0)
        slope = (va(index+1) - va(index)) / (time(index + 1) - time(index));
        Va_zero(end+1) = time(index) - va(index)./slope;
    end
end

for index = 1:length(vb)-1 % calculate the zero-crossings of Vb for the rising edge
    if(vb(index) < 0 && vb(index+1) > 0)
        slope = (vb(index+1) - vb(index)) / (time(index + 1) - time(index));
        Vb_zero(end+1) = time(index) - vb(index)./slope;
    end
end

if Va_zero(1) >= Vb_zero(1)
    DeltaT = Vb_zero(3) - Va_zero(2); % time shift
else
    DeltaT = Vb_zero(3) - Va_zero(3); % time shift
end
PS = 360 .* DeltaT .* frequency; % calculate the phase shift in degrees

%% Plot Va and Vb as a function of time
Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(time.*1000, va, time.*1000, vb, 'linewidth',2.0)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Time (ms)', 'fontsize', 16);
ylabel('Voltage (V)', 'fontsize', 16);
title(sprintf('Frequency = %d kHz', frequency/1000));
legend('Node Voltage Va', 'Node Voltage Vb');

%% Add peak voltages and phase shift information to the graph
t1 = sprintf('V_A peak = %0.3g V \n',Va_peak);
t2 = sprintf('V_B peak = %0.3g V \n',Vb_peak);
t3 = sprintf('PS = %0.3g ^{o}',PS);
text=[t1 t2 t3];
dim = [.15, .7 .2 .2];
annotation('textbox',dim,'String',text,'FitBoxToText','on', 'BackgroundColor','white', 'FaceAlpha',0.8,'fontsize', 16);

%% end of M file