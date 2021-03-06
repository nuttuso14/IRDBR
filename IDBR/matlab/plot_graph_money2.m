%X = [5	10	20	60	80	100	200	250];
X = [50	150	300	600	800	1000	1200	1800];

Mo_money_static = [99439.90	729631.00	2655730.00	7600740.00	9856120.00	10659800.00	11797200.00	13270700.00];
Mo_money_dbr = [93775.40	711776.00	2703280.00	7697760.00	9777230.00	11224400.00	12226500.00	13134600.00];
Mo_money_qedf = [92661.20	669168.00	2500020.00	6862790.00	9020060.00	10164600.00	10847100.00	12582900.00];
Mo_money_qssf = [92357.80	652713.00	2452050.00	6890490.00	8780310.00	10126300.00	11088500.00	12390300.00];
Mo_money_sdbr = [110016.00	802776.00	2991970.00	8256920.00	10567700.00	12175600.00	12752800.00	13753000.00];
Mo_money_idbr = [158738.00	1185380.00	4458130.00	11827700.00	14783500.00	16681100.00	17463000.00	19579900.00];
														
i = i+1;
figure(i)

semilogx(X,Mo_money_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
%semilogx(X,Mo_money_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
%hold on
%semilogx(X,Mo_money_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
%hold on
semilogx(X,Mo_money_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[B_{UE}] ($)','FontSize', 14);
ylabel('Mobile Operator Revenue ($)','FontSize', 15);

%xticklabels({'5','10','20','60','80','100','200','250'});
xticklabels({'50','150','300','600','800','1000','1200','1800'});

set(gca, 'XTick', X);

%legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);
legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

Mo_puser_static = [2.78099	19.6523	67.0909	160.14	197.016	220.778	239.328	268.567];
Mo_puser_dbr = [2.56856	18.888	67.0257	160.977	196.868	220.44	238.459	265.245];
Mo_puser_qedf = [2.6424	17.9277	61.8571	146.663	180.575	203.117	220.076	248.963];
Mo_puser_qssf = [2.59054	17.6844	60.8026	147.22	181.588	203.913	220.115	248.174];
Mo_puser_sdbr = [2.4779	17.5658	59.0844	138.469	166.61	185.671	198.238	217.199];
Mo_puser_idbr = [2.35412	16.8713	58.9264	140.684	169.452	187.228	198.877	218.492];

i = i+1;
figure(i)

semilogx(X,Mo_puser_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
%semilogx(X,Mo_puser_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
%hold on
%semilogx(X,Mo_puser_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
%hold on
semilogx(X,Mo_puser_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[B_{UE}] ($)','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

%xticklabels({'5','10','20','60','80','100','200','250'});
xticklabels({'50','150','300','600','800','1000','1200','1800'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

blocking_static = [0.88078100	0.87598600	0.86834700	0.84173700	0.83349500	0.83897800	0.83586600	0.83519900];
blocking_dbr = [0.87857400	0.87429100	0.86538600	0.83974100	0.83439000	0.82979900	0.82905400	0.83460900];
blocking_qedf = [0.88282900	0.87596400	0.86540500	0.84383400	0.83382700	0.83325700	0.83589700	0.83111800];
blocking_qssf = [0.88088600	0.87682200	0.86550400	0.84355800	0.83908300	0.83493000	0.83198600	0.83393100];
blocking_sdbr = [0.85181300	0.84773000	0.83075300	0.80061300	0.78798300	0.78179800	0.78574600	0.78869500];
blocking_idbr = [0.77513600	0.76585800	0.74740900	0.71927400	0.71124500	0.70313600	0.70709100	0.70208700];

i = i+1;
figure(i)

semilogx(X,blocking_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
%semilogx(X,blocking_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
%hold on
%semilogx(X,blocking_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
%hold on
semilogx(X,blocking_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[B_{UE}] ($)','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

%xticklabels({'5','10','20','60','80','100','200','250'});
xticklabels({'50','150','300','600','800','1000','1200','1800'});
set(gca, 'XTick', X);

%legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);
legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)

deadline_static = [0.445311	0.429095	0.384827	0.25936	0.212245	0.196529	0.188039	0.191589];
deadline_dbr = [0.42017	0.401921	0.365715	0.235178	0.189393	0.170018	0.164375	0.169591];
deadline_qedf = [0.360595	0.347265	0.321383	0.219285	0.172085	0.146674	0.138208	0.133258];
deadline_qssf = [0.366459	0.351594	0.324588	0.217674	0.170641	0.147201	0.135838	0.133918];
deadline_sdbr = [0.71612	0.674996	0.546121	0.316284	0.276424	0.261864	0.260528	0.271936];
deadline_idbr = [0.649681	0.599431	0.478429	0.287964	0.25484	0.245278	0.24705	0.253956];

semilogx(X,deadline_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[B_{UE}] ($)','FontSize', 14);
ylabel('P_{miss}','FontSize', 15);

%xticklabels({'5','10','20','60','80','100','200','250'});
xticklabels({'50','150','300','600','800','1000','1200','1800'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)

V0_static = [0.928433838	0.987338867	1.167819824	1.410144043	1.464855957	1.526538086	1.53449707	1.520837402];
V0_dbr = [0.938413086	0.99119873	1.185140381	1.435864258	1.505187988	1.515722656	1.533898926	1.546008301];
V0_qedf = [0.961934814	0.98748291	1.165980225	1.456140137	1.492126465	1.521081543	1.539697266	1.518029785];
V0_qssf = [0.945394287	0.99866333	1.168430176	1.459899902	1.508862305	1.525	1.54041748	1.522814941];
V0_sdbr = [1.359362793	1.421850586	1.555810547	1.813220215	1.843847656	1.858117676	1.881359863	1.886120605];
V0_idbr = [1.719519043	1.714660645	1.801733398	1.982470703	2.020092773	2.028552246	2.058068848	2.033374023];



semilogx(X,V0_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[B_{UE}] ($)','FontSize', 14);
ylabel('Average Offloading Volume (GB)','FontSize', 15);

%xticklabels({'5','10','20','60','80','100','200','250'});
xticklabels({'50','150','300','600','800','1000','1200','1800'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

 