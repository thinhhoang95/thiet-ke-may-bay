sTO = 1200; % takeoff and initial climb horizontal distance in ft
sigma = 1; % at SL, relative density (ISA)
CLmaxTO = [1.4; 1.8; 2.2]; % Flaps at takeoff
clear t;
syms t;
TOP23 = vpasolve(sTO == 8.134*t+0.0149*t^2,150);
TOP23=TOP23(TOP23>0);
disp('TOP23 in lbs^2/ft^2*hp')
disp(TOP23);
WSTO = linspace(0.5,50,200);
WPTO = [];
for iter=1:size(CLmaxTO,1)
    WPTO = [WPTO;(TOP23 * sigma * CLmaxTO(iter)) ./ WSTO];
    plot(WSTO,WPTO(iter));
end
figure
plot(WSTO,WPTO(1,:)','red');
hold on
plot(WSTO,WPTO(2,:)','green')
hold on
plot(WSTO,WPTO(3,:)','blue');
hold on