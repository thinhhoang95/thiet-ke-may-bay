close all;
clear all;
clc;

disp('AIRCRAFT DESIGN PROJECT')
disp('Team 2: Nguyen Khanh, Le Khanh Linh, Ho Nhat Tuong Minh, Hoang Dinh Thinh')
disp('-----------------------')

disp('First run with 0.8 0.6 10')
zeta_p_cr = 0.86; % Table 2.2, ranging from 0.7 to 0.82
cp_cr = 0.44; % Table 2.2, ranging from 0.5 to 0.7
LoDcrz = 11; % Table 2.2, ranging from 10 to 12 | L/D cruise

run('Tinhtoankhoiluong.m')
run('Phantichdonhay.m')
% run('TinhtoanWSTO.m') % Wing loading stalling speed sizing
run('TinhtoanWPTO.m') % Power loading stalling speed sizing
run('Tinhtoanlanding.m') 

title('Stall speed sizing');
xlabel('W/S (psf)');
ylabel('T/W or W/P');
legend('CLmax 1.4/1.7','CLmax 1.7/2.0','CLmax 1.9/2.3')