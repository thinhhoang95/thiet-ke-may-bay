% Thiet ke may bay

sGL = 500; % roll-out distance, in ft
VSL = sqrt(sGL/0.265); % kts
VSL = 1.6878 * VSL; % ft/s
CLMAXL = [1.7; 2.0; 2.3];
WSTOlandlim = VSL^2*0.002378/2/0.95*CLMAXL;
plot([WSTOlandlim(1);WSTOlandlim(1)],[0;400],'red')
hold on
plot([WSTOlandlim(2);WSTOlandlim(2)],[0;400],'green')
hold on
plot([WSTOlandlim(3);WSTOlandlim(3)],[0;400],'blue')
hold on
