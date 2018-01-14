close all;
clear all;
clc;

disp('AIRCRAFT DESIGN PROJECT')
disp('Team 2: Nguyen Khanh, Le Khanh Linh, Ho Nhat Tuong Minh, Hoang Dinh Thinh')
disp('-----------------------')

disp('First run with 0.8 0.6 10')
zeta_p_cr = 0.87; % Table 2.2, ranging from 0.7 to 0.82
cp_cr = 0.46; % Table 2.2, ranging from 0.5 to 0.7
LoDcrz = 11; % Table 2.2, ranging from 10 to 12 | L/D cruise

run('Tinhtoankhoiluong.m')
run('Phantichdonhay.m')
% run('TinhtoanWSTO.m') % Example
run('Tinhtoantakeoff.m') % Taking off distance sizing
run('Tinhtoanlanding.m') % Landing distance sizing 
run('Tinhtoancruise.m') % Cruise speed sizing
run('Tinhtoanclimb.m') % Climb sizing
run('Tinhtoantimetoclimb.m');

hold off
title('Sizing diagram');
xlabel('W/S (psf)');
ylabel('T/W or W/P');
legend('CLmax 1.4/1.7','CLmax 1.7/2.0','CLmax 1.9/2.3','FAR 23.65 RC','FAR 23.77 CGR','FAR 23.65 CGR');