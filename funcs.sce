function []= settime(dur, precision)
    ts=linspace(0, dur, dur * precision + 1);
    t= resume (ts)
endfunction

function []= simup(name, kcr, tcr, ccc)
    P=0.5 * kcr;
	settime(45, 100);
    x=csim('step', t, (g*P)/.(1)); //// PI
    plot(t, x, ccc);
    legend(name);
endfunction

function []= simupi(name, kcr, tcr, ccc)
    PI=0.45 * kcr + 0.54*(kcr/(tcr*s));
	settime(45, 100);
    ypi=csim('step', t, (g*PI)/.(1));
    plot(t, ypi, ccc);
    legend(name);
endfunction

function []= simupid(name, kcr, tcr, ccc)
    PID=0.075*kcr*tcr*(((s+4*(1/tcr))^2)/s);
	settime(45, 100);
    ypid=csim('step', t, (g*PID)/.(1));
    plot(t, ypid, ccc);
    legend(name);
endfunction

