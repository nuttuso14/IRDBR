X = [0.25 0.5 0.75 1 2 4 5];

Mo_money_static = [7747650.00	5708320.00	4418100.00	3667280.00	2185880.00	1148190.00	914806.00];
Mo_money_dbr = [7653140.00	5338170.00	4352530.00	3398270.00	1864130.00	951058.00	832548.00];
Mo_money_sdbr = [8100920.00	5737670.00	4499430.00	3546500.00	1924910.00	971832.00	814988.00];
Mo_money_idbr = [11224400.00	9441420.00	7212270.00	6271750.00	3909340.00	1938840.00	1063660.00];

i = i+1;
figure(i)

semilogx(X,Mo_money_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[t_0] (Unit: E[t_1])','FontSize', 14);
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15);

xticklabels({'0.25', '0.5', '0.75', '1', '2', '4', '5'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;

Mo_puser_static = [161.101	134.31	114.364	101.424	68.1575	40.7317	34.4443];
Mo_puser_dbr = [153.678	126.527	107.097	91.9769	59.5377	34.4674	29.9434];
Mo_puser_sdbr = [131.86	109.564	93.9986	82.5957	54.8517	32.3879	27.4703];
Mo_puser_idbr = [136.887	115.508	98.5054	87.4356	61.546	40.3529	35.6169];

i = i+1;
figure(i)

semilogx(X,Mo_puser_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[t_0] (Unit: E[t_1])','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'0.25', '0.5', '0.75', '1', '2', '4', '5'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;

blocking_static = [0.83992	0.857724	0.871317	0.879743	0.892923	0.90624	0.911595];
blocking_dbr = [0.833971	0.859494	0.864794	0.876478	0.895655	0.907739	0.907651];
blocking_sdbr = [0.795147	0.825479	0.840809	0.856474	0.882933	0.900014	0.901229];
blocking_idbr = [0.725804	0.727763	0.75546	0.760703	0.788193	0.839885	0.900729];


i = i+1;
figure(i)

semilogx(X,blocking_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[t_0] (Unit: E[t_1])','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'0.25', '0.5', '0.75', '1', '2', '4', '5'});
set(gca, 'XTick', X);
legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;



 