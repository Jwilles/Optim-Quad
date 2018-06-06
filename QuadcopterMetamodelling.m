close all 
clear all
clc

Propeller.Diameter=[8 9 10 11 12 14]*(0.0254);
Propeller.Weight=[7.1 9.1 11.9 13.9 17.9 25 ]/1000;
Propeller.Ct=[0.1338 0.1262 0.1222 0.1156 0.1146 0.1027 ];
Propeller.Cp=[0.0897 0.0837 0.0797 0.0746 0.0727 0.0630];

Battery.Weight=[179 95 309 618 397]/1000;
Battery.Capacity=[2.2 1 4 8 5];
Battery.Voltage=[12 12 12 12 12];
Battery.Crat=[25 25 25 25 25];

Motor.Weight=[32 54 54 64 79]/1000;
Motor.Kv=[3900 2640 3200 2608 1630];
Motor.Watt=[200 375 415 430 600];
Motor.Resist=[0.064 0.063 0.04 0.048 0.079];


[PropModel,perf]=dacefit(Propeller.Diameter',[Propeller.Weight' Propeller.Ct' Propeller.Cp'],@regpoly0,@corrgauss,2);
[BatModel,perf]=dacefit(Battery.Capacity',Battery.Weight',@regpoly0,@corrgauss,2);
[MotorModel,perf]=dacefit(Motor.Watt',[Motor.Weight' Motor.Kv' Motor.Resist'], @regpoly0, @corrgauss,10);

save PropModel.mat
save BatModel.mat
save MotorModel.mat

% Wa=200:1:600;
% y=predictor(Wa',MotorModel);
% plot(Wa,y(:,3))
