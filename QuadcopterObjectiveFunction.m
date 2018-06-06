function [ f ] = ObjectiveFunction(x) %Ct np Dp Mp Mm Mbat Cp Vbat Cbat
  
  rho=1.2;
  alpha=1;
  beta=1;
  gamma=1;
  g=9.81;
  k=1;
  
  f = alpha*(4*(rho*x(1)*x(2)^2*x(3)^4)/((4*(x(3)/sqrt(2))*k+4*(x(4)+x(5))+x(6))*g)) + beta*((1/(4*(rho*x(7)*x(2)^3*(3)^5)/(x(8)*x(9)))+gamma*((4*(2*(x(4)+x(5))*(x(3)/sqrt(2))^2+2*(x(3)/sqrt(2))^3*k/3))
  
  % f = alpha*(4*(rho*Ct*np^2*Dp^4)/((4*(Dp/sqrt(2))*k+4*Mact+Mbat)*g)) + beta*((1/(4*(rho*Cp*np^3*Dp^5)/(Vbat*Cbat))+gamma*((4*(2*Mact*(Dp/sqrt(2))^2+2*(Dp/sqrt(2))^3*k/3))
  
  % f2D(i) = 1/(4*(rho*Cp*np^3*Dp^5)/(Vbat*Cbat));
  % 
  % f3D(i) =  (4*(2*Mact*(Dp/sqrt(2))^2+2*(Dp/sqrt(2))^3*k/3));
end

