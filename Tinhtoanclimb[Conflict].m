%% Sizing to RC - FAR 23.65 RC
clearvars WTOS;
WTOSrange = [0.01:0.1:50];
WPCLhist = [];
WPLhist = [];
WPCGRhist = [];
for i=1:size(WTOSrange,2)
WTOS = WTOSrange(i);
c=1.0892; d=0.5147; % Propeller driven aircraft
Swet=10^(c+d*log10(WTO));
a=-2.031; b=1; % with cf=0.005 - table 3.4 page 134
f=10*(a+b*log10(Swet));
S=WTO/WTOS; % WTOS: WTO/S as S is unknown, and WTOS range from 0 to 100
CD0 = f/S;
A=8.5; e=0.85; % EDITABLE: Aspect ratio and e with takeoff configuration
deltaCD0 = 0.015;
CD0 = CD0 + deltaCD0;
CDL = 1/(pi*A*e);
CL32CDmax = (sqrt(3*CD0/CDL)^(3/2))/(4*CD0);
RC = 500; % fpm, EDITABLE: rate of climb
RCP23 = 1/33000 * RC;
WPCL = (1/1.1) * zeta_p_cr / (RCP23 + sqrt(WTOS)/(19*CL32CDmax*sqrt(sigma))); % sizing to RC
WPCLhist=[WPCLhist;WPCL];

%% Sizing to FAR 23.77 CGR
CGR = 1/30;
CLmaxL = 2.1; % CLmax in landing configuration
LDLmax = CLmaxL / (deltaCD0 + CDL*CLmaxL^2);
CGRP = (CGR+1/LDLmax)/sqrt(CLmaxL);
WPL = 18.97 * zeta_p_cr / CGRP / sqrt(WTOS) ; % sizing to landing RC
WPLhist = [WPLhist;WPL];

%% Sizing to climb gradient FAR 23.65 CGR
CLclimb = 1.7; % =1.9-0.2, CL at climb configuration
LDclimb = CLclimb / (CD0 + CDL * CLclimb^2);
CGRP = (0.0833 + 1/(LDclimb))/sqrt(CLclimb);
WPCGR = (1/1.1) * 18.97 * zeta_p_cr * sqrt(sigma) / CGRP / sqrt(WTOS);
WPCGRhist = [WPCGRhist;WPCGR];
end

plot(WTOSrange,WPCLhist,'r--')
hold on
plot(WTOSrange,WPLhist,'g--')
hold on
plot(WTOSrange,WPCGRhist,'b--')
hold on