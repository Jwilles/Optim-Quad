function [ La m_actuator ] = OCAL( x,p )


load PropModel.mat
load MotorModel.mat
load BatModel.mat


PropData=predictor(x(1),PropModel);
BatData=predictor(x(2),BatModel);
MotorData=predictor(x(4),MotorModel);


La=x(1)/sqrt(2);
m_actuator=PropData(1)+MotorData(1);
end

