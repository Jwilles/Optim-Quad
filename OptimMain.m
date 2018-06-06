clc

A=[];
b=[];
Aeq=[];
beq=[];
lb=[0.2032 1 1000/60 200];
ub=[0.3556 8 7000/60 600];
x0=[0.3 1 4000/60 200];

load D.mat

fmin=0;

for i=1:10
  x0=D(:,i);
  options = optimoptions('fmincon','Algorithm','interior-point','Display', 'iter', 'MaxFunEvals', 3000, 'MaxIter', 1000);%'PlotFcns', { @optimplotfval })%@optimplotx @optimplotconstrviolation});% 'TolFun', 1e-3, 'TolX', 1e-3
  [x,fval,exitflag,output]=fmincon(@ObjectiveFunction,x0,A,b,Aeq,beq,lb,ub,@nonlcon,options)
  
  if fval<fmin
      fmin=fval;
  end

end

load PropModel.mat
load MotorModel.mat
load BatModel.mat

fmin
PropData=predictor(x(1),PropModel)
BatData=predictor(x(2),BatModel)
MotorData=predictor(x(4),MotorModel)

nonlcon(x)
