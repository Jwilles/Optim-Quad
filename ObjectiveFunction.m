function [ f ] = ObjectiveFunction(x) 


% Loading MetaModels of Quadcopter Components
load PropModel.mat
load BatModel.mat
load MotorModel.mat

%Defining Constants
rho=1.225;
% alpha=1;
% beta=1;

g=9.81;
k=0.045;
Mm=1;
Vbat=12;

PropData=predictor(x(1),PropModel);
BatData=predictor(x(2),BatModel);
MotorData=predictor(x(4),MotorModel);

%% Optimization for Payload Capacity

%f=-4*(rho*PropData(2)*x(3)^2*x(1)^4)/((4*(x(1)/sqrt(2))*k+4*(PropData(1)+MotorData(1))+BatData)*g)


%% Optimization for Flight Time

%f=-((4*(rho*PropData(3)*x(3)^3*x(1)^5)/(Vbat*x(2))));


f=-((Vbat*x(2))/(4*(rho*PropData(3)*x(3)^3*x(1)^5)));


%% Optimization for Dymanic Performance


%f=((4*(2*(PropData(1)+MotorData(1))*(x(1)/sqrt(2))^2+2*(x(1)/sqrt(2))^3*k/3))


% f2D(i) = 1/(4*(rho*Cp*np^3*Dp^5)/(Vbat*Cbat));
% 
% f3D(i) =  (4*(2*Mact*(Dp/sqrt(2))^2+2*(Dp/sqrt(2))^3*k/3));


%f = alpha*(4*(rho*x(1)*x(2)^2*x(3)^4)/((4*(x(3)/sqrt(2))*k+4*(x(4)+x(5))+x(6))*g)) + beta*((1/(4*(rho*x(7)*x(2)^3*(3)^5)/(x(8)*x(9)))+gamma*((4*(2*(x(4)+x(5))*(x(3)/sqrt(2))^2+2*(x(3)/sqrt(2))^3*k/3))




 %f = alpha*(4*(rho*Ct*np^2*Dp^4)/((4*(Dp/sqrt(2))*k+4*Mact+Mbat)*g)) + beta*((1/(4*(rho*Cp*np^3*Dp^5)/(Vbat*Cbat))+gamma*((4*(2*Mact*(Dp/sqrt(2))^2+2*(Dp/sqrt(2))^3*k/3))



end

