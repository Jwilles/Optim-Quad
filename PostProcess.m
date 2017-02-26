function [Inertia, mass] = PostProcess_uav( x )


load PropModel.mat
load MotorModel.mat
load BatModel.mat

g=9.81;
k=0.045;
rho=1.225;
Vbat=12

PropData=predictor(x(1),PropModel);
BatData=predictor(x(2),BatModel);
MotorData=predictor(x(4),MotorModel);

Ixx=((*(2*(PropData(1)+MotorData(1))*(x(1)/sqrt(2))^2+2*(x(1)/sqrt(2))^3*k/3)));

Inertia=[Ixx 0 0;0 Ixx 0;0 0 2*Ixx];


mass=4*(x(1)/sqrt(2))*k+PropData(1)+BatData(1)+MotorData(1);
