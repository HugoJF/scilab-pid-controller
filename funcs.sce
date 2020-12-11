function [t] = gettime(dur, precision)
    t = linspace(0, dur, dur * precision + 1);
endfunction

function [y] = simu_zn1_p(t, T, L)
    P = T/L
    y = csim('step', t, (g*P)/.(1));
endfunction

function [y] = simu_zn1_pi(t, T, L)
    PI = 0.9*T/L + 0.27*T/(L^2*s)
    y = csim('step', t, (g*PI)/.(1));
endfunction

function [y] = simu_zn1_pid(t, T, L)
    PID = 0.6*T*(s+L^-1)^2/s
    y = csim('step', t, (g*PID)/.(1));
endfunction

function [y] = simu_zn2_p(t, kcr, tcr)
    P = 0.5 * kcr;
    y = csim('step', t, (g*P)/.(1));
endfunction

function [y] = simu_zn2_pi(t, kcr, tcr)
    PI = 0.45 * kcr + 0.54*(kcr/(tcr*s));
    y = csim('step', t, (g*PI)/.(1));
endfunction

function [y] = simu_zn2_pid(t, kcr, tcr)
    PID=0.075*kcr*tcr*(((s+4*(1/tcr))^2)/s);
    y = csim('step', t, (g*PID)/.(1));
endfunction

/*
 * Computes the settling time for a given response
 *
 * t - time vector
 * y - response vector
 * delta - settling criteria
 */
function [settl]= settlingtime(t, y, delta)
    index = size(y)
    index = index(2)
    
    while (index > 0 && y(index) > (1-delta) && y(index) < (1+delta))
        index = index - 1
    end
    
    settl = t(index)
endfunction

/*
 * Computes the rise time for a given response
 *
 * t - time vector
 * y - response vector
 * delta - rise criteria
 */
function [rise]= risetime(t, y, delta)
    maxindex = size(y)
    maxindex = maxindex(2)
    index = 1
    
    while (index <= maxindex && y(index) < (1-delta))
        index = index + 1
    end
    
    rise = t(index)
endfunction
