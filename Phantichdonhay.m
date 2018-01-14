% AIRCRAFT DESIGN PROJECT
% Team 2: Nguyen Khanh, Le Khanh Linh, Ho Nhat Tuong Minh, Hoang Dinh Thinh
% Sensitivity analysis

A = -0.144;
B = 1.1162;
Mtfo = 0.005;
Mres = Wfres/((1-Mff)*WTO);
C = (1 - (1+Mres)*(1-Mff) - Mtfo);
D = WPL; % Wcrew = 0 as it is accounted in payload weight

%% TAKEOFF WEIGHT TO PAYLOAD WEIGHT
disp('Sensitivity of TOW to PLW: partial WTO / partial WPL');
WTOWPL = B*WTO*1/(D-C*(1-B)*WTO)

%% TAKEOFF WEIGHT TO EMPTY WEIGHT
disp('Sensitivity of TOW to EW: partial WTO / partial WE');
WTOWE = B*WTO*1/(10^((log10(WTO)-A)/B))

%% TAKEOFF WEIGHT TO RANGE
disp('Sensitivity of TWO to RANGE: partial WTO / partial R');
F = -B*WTO^2*(1/(C*WTO*(1-B)-D))*(1+Mres)*Mff;
WTOR = F*cp_cr*1/(375*zeta_p_cr*LoDcrz) % lbs/nm

%% TAKEOFF WEIGHT TO SPECIFIC FUEL CONSUMPTION
disp('Sensitivity of TWO to SFC: partial WTO / partial c_p');
WTOCP = F*range*1/(375*zeta_p_cr*LoDcrz)

%% TAKEOFF WEIGHT TO PROPELLER EFFICIENCY
disp('Sensitivity of TWO to zeta_p: partial WTO / partial zeta_p');
WTOzetap = -F*range*cp_cr*1/(375*zeta_p_cr^2*LoDcrz)

%% TAKEOFF WEIGHT TO L/D RATIO
disp('Sensitivity of TWO to L/D: partial WTO / partial L/D');
WTOLoD = -F*range*cp_cr*1/(375*zeta_p_cr*LoDcrz^2)