close all

% Loading MetaModels of Quadcopter Components
load PropModel.mat
load BatModel.mat
load MotorModel.mat

%Defining Constants
rho=1.225;
g=9.81;
k=0.045;
Mm=1;
Vbat=12;


n=1000;
p=4;

lb=[0.2032 1 1000/60 200]';
ub=[0.3556 8 7000/60 600]';

X = lhsdesign(p,n);%'criterion','correlation');
D = bsxfun(@plus,lb,bsxfun(@times,X,(ub-lb)));

save D.mat




for i=1:1:1000
  PropData=predictor(D(1,i),PropModel);
  BatData=predictor(D(2,i),BatModel);
  MotorData=predictor(D(4,i),MotorModel);

  LHf(i)=-((Vbat*D(2,i))/(4*(rho*PropData(3)*D(3,i)^3*D(1,i)^5)));
end

figure
subplot(2,2,1)
plot(D(1,:),LHf,'.')
xlabel('Dp')
ylabel('Objective Function')
axis([0.2032 0.3556 -50 0.5])

subplot(2,2,2)
plot(D(2,:),LHf,'x')
axis([0 9 -50 0.5])
xlabel('Cbat')


subplot(2,2,3)
plot(D(3,:),LHf,'+')
xlabel('np')
ylabel('Objective Function')
axis([500/60 8000/60 -50 0.5])

subplot(2,2,4)
plot(D(4,:),LHf,'o')
axis([100 700 -50 0.5])
xlabel('Wm')








