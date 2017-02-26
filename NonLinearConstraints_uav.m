function [ c ceq] = NonLinearConstraints_uav( x , p )

ceq=[];

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


% Flight Time
c(1)=0.2-((Vbat*x(2))/(4*(rho*PropData(3)*x(3)^3*x(1)^5)));


%Payload Capacity
c(2)=4 - 4*(rho*PropData(2)*x(3)^2*x(1)^4)/((4*(x(1)/sqrt(2))*k+4*(PropData(1)+MotorData(1))+BatData)*g);

%Inertia
c(3)=((4*(2*(PropData(1)+MotorData(1))*(x(1)/sqrt(2))^2+2*(x(1)/sqrt(2))^3*k/3))-0.03);

%Motor Time Constant
c(4)=(PropData(1)*x(1)^2*MotorData(3))/(12*((MotorData(3)*(rho*PropData(3)*x(3)^3*x(1)^5)/(2*pi*x(3))^2)+669/MotorData(2)^2))-0.2;
end

