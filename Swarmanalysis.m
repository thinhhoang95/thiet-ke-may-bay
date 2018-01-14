clear all;
clc;

disp('AIRCRAFT DESIGN PROJECT')
disp('Team 2: Nguyen Khanh, Le Khanh Linh, Ho Nhat Tuong Minh, Hoang Dinh Thinh')
disp('-----------------------')

swarm_size=100;
zeta_p_cr_range = randbetween(0.7,0.82,swarm_size);
cp_cr_range = randbetween(0.5,0.7,swarm_size);
LoDcrz_range = randbetween(10,12,swarm_size);
WTOhist = [];

for iter=1:swarm_size
    close all
    zeta_p_cr = zeta_p_cr_range(iter); % Table 2.2, ranging from 0.7 to 0.82
    cp_cr = cp_cr_range(iter); % Table 2.2, ranging from 0.5 to 0.7
    LoDcrz = LoDcrz_range(iter); % Table 2.2, ranging from 10 to 12 | L/D cruise
    run('Tinhtoankhoiluong.m')
    run('Phantichdonhay.m')
    WTOhist = [WTOhist; WTO];
    clearvars -except WTOhist zeta_p_cr_range cp_cr_range LoDcrz_range iter swarm_size;
end

figure
scatter(1:swarm_size,WTOhist);
title('WTO estimation');

disp('Max of WTO');
disp(max(WTOhist));
disp('Min of WTO');
disp(min(WTOhist));
disp('Avg of WTO');
disp(mean(WTOhist));

figure
histogram(WTOhist,50);