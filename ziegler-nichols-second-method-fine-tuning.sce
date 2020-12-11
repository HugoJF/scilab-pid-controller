exec('C:\Users\hugo_\Desktop\trabalho-controller\prep.sce', -1)
exec('C:\Users\hugo_\Desktop\trabalho-controller\funcs.sce', -1)

// Simulation parameters
t = gettime(30, 100);

disp('=== FIRST BEST MANUAL TUNING ===')
y1 = simu_zn2_pi(t, 0.8, 6.6)
settl = settlingtime(t, y1, 0.02)
mp = max(y1)
rise = risetime(t, y1, 0.02)
disp(sprintf('Overshoot: %f', mp))
disp(sprintf('Rise time (2%%): %f seconds', rise))
disp(sprintf('Settling time (2%%): %f seconds', settl))


disp('=== SEMI AUTOMATED TUNING ===')
y2 = simu_zn2_pi(t, 0.85, 6.9)
settl = settlingtime(t, y2, 0.02)
mp = max(y2)
rise = risetime(t, y2, 0.02)
disp(sprintf('Overshoot: %f', mp))
disp(sprintf('Rise time (2%%): %f seconds', rise))
disp(sprintf('Settling time (2%%): %f seconds', settl))

plot(t, y1, t, y2);
legend(['Manual tuning', 'Semi-automatic tuning'])

kcrs = linspace(0.75, 0.95, 3);
tcrs = linspace(6.5, 7.3, 5);

/*
for kcr = kcrs
    tcr=6.9
    disp('KCR', kcr, 'TCR', tcr)
    simupi('PI', kcr, tcr, 'r')
end
*/

