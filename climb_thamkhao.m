%Thiet ke may bay
%Drag Polar Determination

disp('Drag Polar for Clean configuration')
disp('----------------')

%One engine Prop
c = 1.0892;
d = 0.5147;
WTO = 1642.5;
Swet = 10^(c + d*log10(WTO));

%Table 3.4 for regression line
cf = 0.005; %Figure 3.21 estimated
a = -2.3010;
b = 1.0000;
f = 10^(a + b*log10(Swet));

%Other parameters
S = 168; %wing area for typical airplanes in ft^2
AR = 8.5; %Aspect ratio
e = 0.85; %from table 3.6 for clean

disp('zero-lift drag coefficient')
CD0 = f/S
k = 1/(pi*AR*e);
%CD = CD0 + k*CL^2

%additional zero-lift drag coeff
dCDTO = 0.015;   %take-off flaps
dCDLF = 0.065;   %landing flaps
dCDLG = 0.020;   %landing gear

%Sizing to rate of climb
%config: gear up, take-off flaps, max. cont. power on all engines
sigma = 1.0;     %sea level
RC = 300;
CD0c = CD0 + dCDTO;
LDmax = 1.345*(AR*e)^0.75/CD0c^0.25;
%RCP = [0.8/WP-(WS^0.5/(19*LDmax*sqrt(sigma)))]= RC/33000
WS = [8.8488 10.7449 12.0090];
WPrc = 0.8./[RC/33000+(WS.^0.5/(19*LDmax*sqrt(sigma)))];
figure
plot(WS,WPrc,'r')
title('climb requirement')
xlabel('wing loading')
ylabel('power loading')
hold on

%Sizing to climb gradient
%Config: gear up, take-off flaps, max. cont. power on all engines
CGR = 0.0833;
CLc = 1.6;
LDc = CLc/(CD0c + k*CLc^2);
CGRP = (CGR + 1/LDc)/sqrt(CLc);
%WP*WS^0.5 = 18.97*0.8*sqrt(sigma)/CGRP
WPcgr = (18.97*0.8*sqrt(sigma)/CGRP)./WS.^0.5
plot(WS,WPcgr,'g')
hold on
legend('rate of climb','climb gradient')