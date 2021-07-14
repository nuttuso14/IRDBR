syms i
lambda_u = 3;
mu = 0.1;
Nmax = 10;
b1 = 5;
b2 = 10;
p1 = 0.685;
beta = 0.5;
rcoupon = 0.25;
zcoupon = 0.5;

listb2 = [5 10 20 30 40 50 60];
for i=1:length(listb2)
    %baseline
    EE = lambda_u/mu;
    P_baseline_b2(i) = ErlangB(EE,Nmax);
    
    %upperbound
    beforeMu = 1+(listb2(i)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_Lower_b2(i) = ErlangB(EE,Nmax);
    
    %SDBR
    beforeMu = 1-(beta*p1)+((p1*listb2(i))/b1);
    EE = lambda_u/(beforeMu*mu);
    P_SDBR_b2(i) = ErlangB(EE,Nmax);
    
    %IDBR
    betaReward = (1-rcoupon)*zcoupon*beta;
    beforeMu = 1-(betaReward*p1)+((p1*listb2(i))/b1);
    EE = lambda_u/(beforeMu*mu);
    P_IDBR_b2(i) = ErlangB(EE,Nmax);
    
end

listP1 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for i=1:length(listP1)
    %baseline
    EE = lambda_u/mu;
    P_baseline_p1(i) = ErlangB(EE,Nmax);
    
    %upperbound
    beforeMu = 1+(b2/b1);
    EE = lambda_u/(beforeMu*mu);
    P_Lower_p1(i) = ErlangB(EE,Nmax);
    
    %SDBR
    beforeMu = 1-(beta*listP1(i))+((listP1(i)*b2)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_SDBR_p1(i) = ErlangB(EE,Nmax);
    
    %IDBR
    betaReward = (1-rcoupon)*zcoupon*beta;
    beforeMu = 1-(betaReward*listP1(i))+((listP1(i)*b2)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_IDBR_p1(i) = ErlangB(EE,Nmax);   
    
end

listbeta = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for i=1:length(listbeta)
    %baseline
    EE = lambda_u/mu;
    P_baseline_beta(i) = ErlangB(EE,Nmax);
    
    %upperbound
    beforeMu = 1+(b2/b1);
    EE = lambda_u/(beforeMu*mu);
    P_Lower_beta(i) = ErlangB(EE,Nmax);
    
    %SDBR
    beforeMu = 1-(listbeta(i)*p1)+((p1*b2)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_SDBR_beta(i) = ErlangB(EE,Nmax);
    
    %IDBR
    betaReward = (1-rcoupon)*zcoupon*listbeta(i);
    beforeMu = 1-(betaReward*p1)+((p1*b2)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_IDBR_beta(i) = ErlangB(EE,Nmax);   
    
end

%discount rcoupon
listRcoupon = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for i=1:length(listRcoupon)
    %baseline
    EE = lambda_u/mu;
    P_baseline_Rcoupon(i) = ErlangB(EE,Nmax);
    
    %upperbound
    beforeMu = 1+(b2/b1);
    EE = lambda_u/(beforeMu*mu);
    P_Lower_Rcoupon(i) = ErlangB(EE,Nmax);
    
    %SDBR
    beforeMu = 1-(beta*p1)+((p1*b2)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_SDBR_Rcoupon(i) = ErlangB(EE,Nmax);
    
    %IDBR
    betaReward = (1-listRcoupon(i))*zcoupon*beta;
    beforeMu = 1-(betaReward*p1)+((p1*b2)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_IDBR_Rcoupon(i) = ErlangB(EE,Nmax);   
    
end

%%%% Zcoupon
listZ = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for i=1:length(listZ)
    %baseline
    EE = lambda_u/mu;
    P_baseline_Z(i) = ErlangB(EE,Nmax);
    
    %upperbound
    beforeMu = 1+(b2/b1);
    EE = lambda_u/(beforeMu*mu);
    P_Lower_Z(i) = ErlangB(EE,Nmax);
    
    %SDBR
    beforeMu = 1-(beta*p1)+((p1*b2)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_SDBR_Z(i) = ErlangB(EE,Nmax);
    
    %IDBR
    betaReward = (1-rcoupon)*listZ(i)*beta;
    beforeMu = 1-(betaReward*p1)+((p1*b2)/b1);
    EE = lambda_u/(beforeMu*mu);
    P_IDBR_Z(i) = ErlangB(EE,Nmax);   
    
end

%%%%%%%%%%% b1
j=j+1;
figure(j)

plot(listb2,P_baseline_b2,'-d','LineWidth',1.2)
hold on
plot(listb2,P_Lower_b2,'-o','LineWidth',1.2)
hold on
plot(listb2,P_SDBR_b2,'-^','LineWidth',1.2)
hold on
plot(listb2,P_IDBR_b2,'-s','LineWidth',1.2)
hold on

xlabel('b_2')
ylabel('Blocking Probability', 'FontSize', 16)
legend('Baseline','Lower Bound','SDBR','IDBR')
xticklabels({'5','10','20','30','40','50','60'});
xlim([5 60]);
set(gca, 'XTick', listb2);
grid on

%%%%%%%%%%% P1
j=j+1;
figure(j)

plot(listP1,P_baseline_p1,'-d','LineWidth',1.2)
hold on
plot(listP1,P_Lower_p1,'-o','LineWidth',1.2)
hold on
plot(listP1,P_SDBR_p1,'-^','LineWidth',1.2)
hold on
plot(listP1,P_IDBR_p1,'-s','LineWidth',1.2)
hold on

xlabel('P_c')
ylabel('Blocking Probability', 'FontSize', 16)
legend('Baseline','Lower Bound','SDBR','IDBR')
xticklabels({'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
xlim([0.1 1]);
set(gca, 'XTick', listP1);
grid on



%%%%%%%%%%% beta
j=j+1;
figure(j)

plot(listbeta,P_baseline_beta,'-d','LineWidth',1.2)
hold on
plot(listbeta,P_Lower_beta,'-o','LineWidth',1.2)
hold on
plot(listbeta,P_SDBR_beta,'-^','LineWidth',1.2)
hold on
plot(listbeta,P_IDBR_beta,'-s','LineWidth',1.2)
hold on

xlabel('\beta')
ylabel('Blocking Probability', 'FontSize', 16)
legend('Baseline','Lower Bound','SDBR','IDBR')
xticklabels({'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
xlim([0.1 1]);
set(gca, 'XTick', listbeta);
grid on

%%%%%%%%%%% Coupon
j=j+1;
figure(j)


plot(listRcoupon,P_baseline_Rcoupon,'-d','LineWidth',1.2)
hold on
plot(listRcoupon,P_Lower_Rcoupon,'-o','LineWidth',1.2)
hold on
plot(listRcoupon,P_SDBR_Rcoupon,'-^','LineWidth',1.2)
hold on
plot(listRcoupon,P_IDBR_Rcoupon,'-s','LineWidth',1.2)
hold on

xlabel('R_{voucher}')
ylabel('Blocking Probability', 'FontSize', 16)
legend('Baseline','Lower Bound','SDBR','IDBR')
xticklabels({'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
xlim([0.1 1]);
set(gca, 'XTick', listRcoupon);
grid on

%%%%%%%%%%% Z
j=j+1;
figure(j)

plot(listZ,P_baseline_Z,'-d','LineWidth',1.2)
hold on
plot(listZ,P_Lower_Z,'-o','LineWidth',1.2)
hold on
plot(listZ,P_SDBR_Z,'-^','LineWidth',1.2)
hold on
plot(listZ,P_IDBR_Z,'-s','LineWidth',1.2)
hold on

xlabel('z_{voucher}')
ylabel('Blocking Probability', 'FontSize', 16)
legend('Baseline','Lower Bound','SDBR','IDBR')
xticklabels({'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
xlim([0.1 1]);
set(gca, 'XTick', listZ);
grid on


function E = ErlangB(E,M)
    %upper term
    upper = E^M/factorial(M);
    lower = 0;
    for i = 0:M
        lower = lower + ((E^i)/factorial(i)); 
    end
    E = upper/lower; 
end