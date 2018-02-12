
f = [100, 200, 400, 600, 800, 1e3, 2e3, 4e3, 6e3, 8e3, 10e3, 20e3, 40e3];

ps_sim = [7.96, 15.6, 29.2, 40, 48.2, 54.4, 70.3, 79.8, 83.1, 84.7, 85.7, 87.6, 88.5];
ps_meas = [2.78, 14.3, 29.7, 40.6, 46.7, 52.6, 68.5, 79.5, 80.4, 81.8, 81.4, 81.5, 78.9];

semilogx(f, ps_sim,'linewidth',2);
hold on;
semilogx(f, ps_meas,'.','markersize',25,'linewidth',100);

xlabel('Frequency (Hz)');
ylabel('Phase shift (degrees)');
title('Simulated & Measured Phase Shift vs Frequency');
legend('Simulated Phase Shift', 'Measured Phase Shift');