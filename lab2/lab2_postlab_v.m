
f = [100, 200, 400, 600, 800, 1e3, 2e3, 4e3, 6e3, 8e3, 10e3, 20e3, 40e3];

vb_sim = [3.41, 3.32, 3.01, 2.64, 2.30, 2.01, 1.16, 0.61, 411e-3, 309e-3, 248e-3, 124e-3, 62.2e-3];
vb_meas = [3.38, 3.25, 2.94, 2.63, 2.25, 1.97, 1.13, 578e-3, 406e-3, 306e-3, 245e-3, 124e-3, 62.5e-3];

semilogx(f,vb_sim,'linewidth',2);
hold on;
semilogx(f,vb_meas,'.','markersize',25,'linewidth',100);

xlabel('Frequency (Hz)');
ylabel('Capacitor Voltage (V)');
title('Simulated & Measured Capacitor Voltage vs Frequency');
legend('Simulated Vb', 'Measured Vb');