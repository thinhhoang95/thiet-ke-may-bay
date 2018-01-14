% Thiet ke may bay
% Tinh toan wing loading (WS - at take off), power-off condition

% Power off stalling performance expectation
CLmax=[1.4 1.7 1.9]; % maximum CL "flaps up/CLEAN CONFIGURATION"
Vs = 72.91; % ft/s = 22.2 m/s or 80 km/h

disp('W/S for Stall Speed Sizing');
WSTOstalllim = (Vs^2*0.0765).*CLmax./(2*32.17) % 0.0765 is air density in lbs/ft^3, WSTO is in psf

plot([WSTOstalllim(1);WSTOstalllim(1)],[0;400],'red')
hold on
plot([WSTOstalllim(2);WSTOstalllim(2)],[0;400],'green')
hold on
plot([WSTOstalllim(3);WSTOstalllim(3)],[0;400],'blue')
hold on