% AIRCRAFT DESIGN PROJECT
% Team 2: Nguyen Khanh, Le Khanh Linh, Ho Nhat Tuong Minh, Hoang Dinh Thinh
% Weight estimation

Wetolerance = 0.005;
iter = 0;
maxiter=2000;
Wehist = [];
Wetenthist = [];

WTO=1700; % lbs (initial gross weight guess)

while true 
    iter=iter+1;
    clc;
    %% PAYLOAD WEIGHT CALCULATION
    disp('PAYLOAD WEIGHT') 
    numOfPax = 2; 
    weightOfPax = 175; %lbs
    weightOfBaggage = 30; %lbs
    weightSecours = 30; % lbs
    WPL = numOfPax * weightOfPax + numOfPax * weightOfBaggage + weightSecours

    %% TAKEOFF WEIGHT
    disp('GROSS TAKEOFF WEIGHT')
    WTO

    %% FUEL CALCULATION
    disp('PHASE 1 : ENGINE START')
    W1 = 0.995 * WTO
    disp('PHASE 2 : TAXI')
    W2 = 0.997 * W1
    disp('PHASE 3 : TAKEOFF')
    W3 = 0.998 * W2
    disp('PHASE 4 : CLIMB')
    W4 = W3 * 0.992
    disp('PHASE 5 : CRUISE')
    range = 500; % miles
    W5 = W4 / exp(range / (375 * (zeta_p_cr/cp_cr) * LoDcrz))
    disp('PHASE 6 : LOITER')
    lrange = 62; % miles - loitering for 30 minutes
    zeta_p_ltr = zeta_p_cr; % Table 2.2
    cp_ltr = cp_cr;
    LoDltr = LoDcrz; % L/D loiter
    W6 = W5 / exp(lrange / (375 * (zeta_p_ltr/cp_ltr) * LoDltr))
    disp('PHASE 7 : DESCENT')
    W7 = W6 * 0.993
    disp('PHASE 8 : LANDING, TAXI, SHUTDOWN')
    W8 = W7 * 0.993
    disp('Fuel fraction')
    Mff = W8/WTO
    disp('Fuel used')
    Wfused = (1-Mff)*WTO
    % Reserve fuel
    disp('Reserved fuel')
    Wfres = W6*(1-1 / exp(90 / (375 * (zeta_p_ltr/cp_ltr) * LoDltr))) % 90 miles to travel to backup airport
    disp('Total fuel weight of aircraft')
    Wf = (1-Mff)*WTO + Wfres

    %% TENTATIVE VALUE OF WOE
    disp('Tentative value of WOE');
    WOEtent = WTO - Wf - WPL

    %% TENTATIVE VALUE OF WETENT
    disp('Tentative value of WEtent');
    Wtfo = 0.005 * WTO; % Neglected fuel & oil trapped on aircraft
    WEtent = WOEtent - Wtfo  % Crew is accounted as part of payload

    %% EMPTY WEIGHT ESTIMATION
    disp('Empty weight estimation');
    We = 10^((log10(WTO)-(-0.144))/1.1162)
    
    Wehist = [Wehist; We];
    Wetenthist = [Wetenthist;WEtent];
    
    % While loop break condition
    if ((abs(We-WEtent)<Wetolerance*We) || iter>maxiter)
        break;
    end
    
    WTO = WTO + (We-WEtent)*5;
end
% We estimation history plot
figure
plot(1:iter,Wehist)
hold on
plot(1:iter,Wetenthist)
title('We estimation history')
xlabel('Iteration (n)')
ylabel('We (lbs)')
legend('We','We tentative')