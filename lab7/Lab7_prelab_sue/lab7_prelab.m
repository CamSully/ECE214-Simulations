addpath('/usr/local/CppSim/CppSimShared/HspiceToolbox');
clear variables;
close all;
hspc_filename = 'lab7_prelab.hspc';

%% Transient analysis:
hspc_addline('.tran 100e-9 6e-3 1e-3', hspc_filename);
ngsim(hspc_filename);
data = loadsig('simrun.raw');

time = evalsig(data, 'TIME');
Vc = evalsig(data,'vc');
Vout = evalsig(data,'vout');

fs = 16; % define font size
lw = 1.5; % define linewidth

figure('Position', [100, 75, 850, 600]);
plot(time.*1000, Vc, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
title('Boost Converter Capacitor Voltage');
ylabel('Capacitor Voltage, V');
xlabel('Time, ms');
legend('Vc');

figure('Position', [100, 75, 850, 600]);
plot(time.*1000, Vout, 'linewidth',lw);
grid on;
set(gca, 'fontsize', fs);
title('Boost Converter Output Voltage');
ylabel('Voltage, V');
xlabel('Time, ms');
legend('Vout');

%% Math
% Rl = 4.89;
% L = 1e-3;
% alpha = 2.445e3;
% wd = 9696e3;;
% A1 = 224e-3;
% A2 = -1.392;
% 
% t = linspace(0,223.6e-3,223.6e3);
% i = A1.*exp(-alpha.*t).*cos(wd.*t) + A2.*exp(-alpha.*t).*sin(wd.*t);
% 
% syms t2
% eqn = L*(A1*(-alpha*exp(-alpha*t2)*cos(wd*t2)-exp(-alpha*t2)*wd*sin(wd*t2)) + A2*(-alpha*exp(-alpha*t2)*sin(wd*t2) + wd*exp(-alpha*t2)*cos(wd*t2))) == 0
% solution = solve(eqn, t2, 'ReturnConditions', true);
% %solution.t
% % fprintf('t = %f + %fj\n', double(solution.t), double((solution.t)/1j));
% 
% plot(t, i);
% grid on;