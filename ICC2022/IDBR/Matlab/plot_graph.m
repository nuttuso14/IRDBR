X = [0.01	0.02	0.03	0.04	0.05	0.1	0.5	1	5	10];

Mo_money_static = [7933180.00	8632430.00	9155920.00	9290090.00	8903690.00	8948950.00	9011490.00	8958660.00	9012700.00	9034520.00];
Mo_money_dbr = [8010600.00	8979490.00	9319850.00	8932390.00	9095050.00	9172230.00	9051090.00	9356500.00	8589610.00	8922770.00];
Mo_money_sdbr = [7923190.00	8939180.00	9113570.00	9231270.00	9642200.00	10184900.00	10280100.00	10371600.00	10294600.00	11005500.00];
Mo_money_idbr = [7976960.00	9336340.00	10118300.00	11312700.00	12154700.00	14071400.00	19098900.00	22569300.00	28006300.00	30537200.00];

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

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;

Mo_puser_static = [265.991	203.437	196.492	194.317	190.952	191.225	188.952	189.834	188.926	188.857];
Mo_puser_dbr = [269.617	201.212	192.13	188.042	188.155	187.852	185.858	185.516	184.735	184.26];
Mo_puser_sdbr = [264.477	177.315	164.573	162.996	163.222	162.237	162.145	160.471	161.244	161.304];
Mo_puser_idbr = [266.681	187.533	179.355	178.274	177.451	168.075	153.34	150.964	145.48	143.724];

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

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;

blocking_static = [0.0132336	0.289883	0.483321	0.601168	0.689101	0.844116	0.968254	0.984267	0.99682	0.998405];
blocking_dbr = [0.0100936	0.258735	0.458805	0.604265	0.67785	0.837054	0.967549	0.983176	0.996899	0.998385];
blocking_sdbr = [0.00130013	0.160146	0.383306	0.526611	0.60859	0.790468	0.957688	0.978444	0.995743	0.997725];
blocking_idbr = [0.00216811	0.167308	0.373063	0.469496	0.54348	0.720391	0.917024	0.950155	0.987157	0.992914];

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

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);
legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;



 