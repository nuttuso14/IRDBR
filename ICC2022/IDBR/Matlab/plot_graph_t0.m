X = [0.25 0.5 0.75 1 2 4 5];

Mo_money_static = [8570860.00	6264810.00	5101670.00	4387860.00	2423030.00	1464700.00	1167510.00];
Mo_money_dbr = [8592400.00	6241430.00	4987960.00	4237920.00	2467020.00	1366540.00	1127110.00];
Mo_money_sdbr = [8868860.00	6462060.00	5025590.00	4149280.00	2272340.00	1245860.00	957182.00];
Mo_money_idbr = [10819400.00	7620610.00	5969140.00	4832800.00	2313500.00	1234140.00	1028130.00];

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

xlabel('E[t_0]/E[t_1]','FontSize', 14);
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15);

xticklabels({'0.25', '0.5', '0.75', '1', '2', '4', '5'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;

Mo_puser_static = [192.198	161.14	139.314	123.272	82.1784	51.8771	43.8254];
Mo_puser_dbr = [184.086	153.75	132.345000	117.720000	78.723000	47.9926	40.895300];
Mo_puser_sdbr = [163.762000	136.368	116.113	101.38	67.4604	41.0822	33.3176];
Mo_puser_idbr = [172.798	150.243	134.94	125.00	99.57	82.02	76.63];

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

xlabel('E[t_0]/E[t_1]','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'0.25', '0.5', '0.75', '1', '2', '4', '5'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;

blocking_static = [0.851273	0.870307	0.877813	0.88134	0.901472	0.905835	0.911017];
blocking_dbr = [0.844827	0.86	0.874168	0.879832	0.895506	0.905117	0.907963];
blocking_sdbr = [0.819604	0.841581	0.855431	0.863104	0.887522	0.898961	0.904125];
blocking_idbr = [0.791264	0.830756	0.85	0.87	0.92	0.95	0.96];

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

xlabel('E[t_0]/E[t_1]','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'0.25', '0.5', '0.75', '1', '2', '4', '5'});
set(gca, 'XTick', X);
legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;



 