function dydt = sir_demografia(~,y,Lambda,beta,alpha,mu)

S = y(1);
I = y(2);
R = y(3);



function dydt = SIR_DEMOGRAFIA(~,y,Lambda,beta,alpha,mu)

S = y(1);
I = y(2);
R = y(3);

dS = Lambda - beta*S*I - mu*S;
dI = beta*S*I - alpha*I - mu*I;
dR = alpha*I - mu*R;

dydt = [dS; dI; dR];

end