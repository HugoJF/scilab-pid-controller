exec('C:\Users\hugo_\Desktop\trabalho-controller\prep.sce', -1)
exec('C:\Users\hugo_\Desktop\trabalho-controller\funcs.sce', -1)

simupi('best', 0.8, 6.6, 'g')
simupi('2ndbest', 0.85, 6.9, 'r')

kcrs = linspace(0.75, 0.95, 3);
tcrs = linspace(6.5, 7.3, 5);

/*
for kcr = kcrs
    tcr=6.9
    disp('KCR', kcr, 'TCR', tcr)
    simupi('PI', kcr, tcr, 'r')
end
*/
