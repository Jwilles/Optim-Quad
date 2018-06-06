close all

% Loading MetaModels of Quadcopter Components
load PropModel.mat
load BatModel.mat
load MotorModel.mat

lb_uav=[0.2032 1 1000/60 200];
ub_uav=[0.3556 8 7000/60 600];

lb_manip=[0 .15 .15]; 
ub_manip=[.6 .3 .3]; 

lb_gripper=[0 15 15 3 3];
ub_gripper=[200 200 200 25 25];

lb=[lb_uav, lb_manip, lb_gripper];
ub=[ub_uav, ub_manip, ub_gripper]; 

n=1000;
p=12;

X = lhsdesign(p,n);%'criterion','correlation');
D = bsxfun(@plus,lb,bsxfun(@times,X,(ub-lb)));

% save D.mat

% for i=1:1:1000
%     
% PropData=predictor(D(1,i),PropModel);
% BatData=predictor(D(2,i),BatModel);
% MotorData=predictor(D(4,i),MotorModel);
% 
% LHf(i)=-((Vbat*D(2,i))/(4*(rho*PropData(3)*D(3,i)^3*D(1,i)^5)));
% 
% end
% 
% figure
% subplot(2,2,1)
% plot(D(1,:),LHf,'.')
% xlabel('Dp')
% ylabel('Objective Function')
% axis([0.2032 0.3556 -50 0.5])
% 
% subplot(2,2,2)
% plot(D(2,:),LHf,'x')
% axis([0 9 -50 0.5])
% xlabel('Cbat')
% 
% 
% subplot(2,2,3)
% plot(D(3,:),LHf,'+')
% xlabel('np')
% ylabel('Objective Function')
% axis([500/60 8000/60 -50 0.5])
% 
% subplot(2,2,4)
% plot(D(4,:),LHf,'o')
% axis([100 700 -50 0.5])
% xlabel('Wm')
