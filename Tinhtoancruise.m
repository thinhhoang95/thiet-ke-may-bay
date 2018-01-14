% Thiet ke may bay
% Cruise speed requirement
V_cr=125; % cruise speed at 200km/h=125mph
I_p= 0.8; % power index with V=125mph,Fig 3.29 Fix Gear,cantilevered configuration
% TODO: Linear regression
% sigma = 0.5328; % density ratio at 6000ft
WS_cr = linspace(0.10,100);
WP_cr=[];
WP_cr=[WS_cr./(sigma*(I_p)^3)];
plot(WS_cr,WP_cr,'yellow');