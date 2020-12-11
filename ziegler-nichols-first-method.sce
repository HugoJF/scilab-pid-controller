exec('C:\Users\hugo_\Desktop\trabalho-controller\prep.sce', -1)
exec('C:\Users\hugo_\Desktop\trabalho-controller\funcs.sce', -1)

// Simulation parameters
t = gettime(45, 100);
ts = gettime(20, 100); // shorter

// Method preparation
ya = csim('step', ts, g);

// Method parameters
L = 2.7
T = 6.3

// Simulations
y = csim('step', t, g/.(1));
yp = simu_zn1_p(t, T, L);
ypi = simu_zn1_pi(t, T, L);
ypid = simu_zn1_pid(t, T, L);

// Plots
subplot(311)
plot(t, y, t, yp, t, ypi);
title('Ziegler-Nichols first method for PID tuning (PID omitted)')
legend(['G response', 'P response', 'PI response']);
subplot(312)
plot(t, ypid);
title('Ziegler-Nichols first method for PID tuning (PID only)')
legend(['PID response']);
subplot(313)
plot(ts, ya);
title('Open loop system response for Ziegler-Nichols'' first method parameter estimation')
legend(['Open loop response'])