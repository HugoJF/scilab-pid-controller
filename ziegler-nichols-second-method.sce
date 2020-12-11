exec('C:\Users\hugo_\Desktop\trabalho-controller\prep.sce', -1)
exec('C:\Users\hugo_\Desktop\trabalho-controller\funcs.sce', -1)

// Simulation parameters
t = gettime(30, 100);

// Method preparation

// Gain estimation
// Very long simulation time to make sure oscillations are stable and consistent
kcr_estimation = 1.48;

tg = gettime(600, 100);
yg = csim('step', tg, (g*kcr_estimation)/.(1));

// Period estimation
// Shorter simulation since we only need the period
tper = gettime(30, 100);
yper = csim('step', tper, (g*kcr_estimation)/.(1));

// Method parameters
kcr = 1.48;
tcr = 11.34;

// Simulations
y = csim('step', t, g/.(1));
yp = simu_zn2_p(t, kcr, tcr);
ypi = simu_zn2_pi(t, kcr, tcr);
ypid = simu_zn2_pid(t, kcr, tcr);

// Plots
subplot(211)
plot(t, y, t, yp, t, ypi, t, ypid);
title('Ziegler-Nichols second method for PID tuning')
legend(['G response', 'P response', 'PI response', 'PID response']);
subplot(223)
plot(tg, yg);
title('Ziegler-Nichols second method gain estimation')
legend(['Closed loop response'])
subplot(224)
plot(tper, yper);
title('Ziegler-Nichols second method period estimation')
legend(['Closed loop response'])