M = [60 100 120];

Sim_M60 = [0	0	0.8650];
Ana_M60 = [0	0	0.8659];

Sim_M100 = [0.9927	0.8346	0.1226];
Ana_M100 = [0.9925	0.8352	0.1226];

Sim_M120 = [0	0.1622	0.0123];
Ana_M120 = [0	0.1617	0.0115];

i = i+1;
figure(i)

semilogx(M,Sim_M60,'-o','LineWidth',1.5)
hold on
semilogx(M,Ana_M60,'-d','LineWidth',1.5)
hold on

semilogx(M,Sim_M100,'-s','LineWidth',1.5)
hold on
semilogx(M,Ana_M100,'-^','LineWidth',1.5)
hold on

semilogx(M,Sim_M120,'-+','LineWidth',1.5)
hold on
semilogx(M,Ana_M120,'-*','LineWidth',1.5)
hold on

xlabel('B_{UE} (dollars)')
ylabel('\alpha', 'FontSize', 18)
%legend('\lambda_i=0.1\lambda_1','\lambda_i=0.5\lambda_1','\lambda_i=0.9\lambda_1')
legend('\Delta_1=1 sim','\Delta_1=1 ana','\Delta_1=2 sim','\Delta_1=2 ana','\Delta_1=3 sim','\Delta_1=3 ana')
xticklabels({'60','100','120'});
%xlim([0.1 1]);
set(gca, 'XTick', M);

grid on