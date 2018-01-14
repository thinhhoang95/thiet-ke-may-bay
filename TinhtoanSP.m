% AIRCRAFT DESIGN PROJECT
% Calculate wing area and power of engine

WSdesign = input('Please choose design point W/S (psf)');
WPdesign = input('Please choose design point W/P (lbs/hp');

disp('Estimated wing area (ft2)');
S = WTO/WSdesign

disp('Estimated wing area (m2)');
S = WTO/WSdesign * 0.0929

disp('Estimated engine power (hp)');
P = WTO/WPdesign