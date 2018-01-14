% Time to climb sizing
clearvars WS;
WSrange=[0.01,0.1,50];
WPTTChist=[];
CD0 = CD0 - deltaCD0;
for i=1:size(WSrange,2)
WS=WSrange(i);
CL32_CD=1.345*(((A*e)^(3/4))/(CD0^(1/4)));
WPTTC=(zeta_p_cr)/((RCP23+(WS^(1/2))/(19*(CL32_CD)*(sigma^(1/2)))));
WPTTChist=[WPTTChist;WPTTC];
end
hold on
plot(WSrange,WPTTChist,'m');
