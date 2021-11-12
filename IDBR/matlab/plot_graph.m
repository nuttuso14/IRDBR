X = [0.01	0.02	0.03	0.04	0.05	0.1	0.5	1	5	10];
Mo_money_static = [7702850.00	8511400.00	8514410.00	8790340.00	8634570.00	8754730.00	8776670.00	8656050.00	8540740.00	8893520.00];
Mo_money_dbr = [7738380.00	8668080.00	8717810.00	8613570.00	8832720.00	8940790.00	8900440.00	8803970.00	8963080.00	8589160.00];
Mo_money_qedf = [7327030.00	7922700.00	7852780.00	7941450.00	7971960.00	7923200.00	8022170.00	8089870.00	8105170.00	8045740.00];
Mo_money_qssf = [7386260.00	7943390.00	7887570.00	7966970.00	8084180.00	8065210.00	7960790.00	8044270.00	8036360.00	8075310.00];
Mo_money_sdbr = [7942380.00	8782490.00	8696030.00	9016750.00	9003270.00	9484870.00	10088800.00	10162800.00	9832410.00	10483200.00];
Mo_money_idbr = [7951530.00	9156130.00	9873240.00	10419800.00	11422600.00	13604500.00	19096400.00	21700000.00	27135600.00	29912700.00];
									
														
i = i+1;
figure(i)

semilogx(X,Mo_money_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Mobile Operator Revenue ($)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

Mo_puser_static = [260.1	196.932	186.961	183.714	182.769	182.166	179.82	180.391	179.824	179.388];
Mo_puser_dbr = [261.326	197.433	187.206	182.421	181.957	181.164	179.847	179.179	179.632	179.697];
Mo_puser_qedf = [248.155	179.275	169.621	167.531	166.433	166.552	165.511	164.669	165.058	165.762];
Mo_puser_qssf = [249.637	179.075	170.476	168.218	167.534	165.349	165.299	165.684	165.914	164.792];
Mo_puser_sdbr = [265.055	174.446	160.139	157.371	155.712	154.155	153.994	154.307	153.737	152.547];
Mo_puser_idbr = [263.435	182.746	172.842	168.379	167.433	157.832	143.006	139.577	135.028	133.419];

i = i+1;
figure(i)

semilogx(X,Mo_puser_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

blocking_static = [0.01637330	0.27761000	0.49448400	0.60323500	0.68441800	0.83913000	0.96748100	0.98399600	0.99683300	0.99834700];
blocking_dbr = [0.01454290	0.26712700	0.48041100	0.60647300	0.67582900	0.83565600	0.96703300	0.98362500	0.99667300	0.99840700];
blocking_qedf = [0.01008980	0.26613800	0.48494500	0.60423400	0.67991400	0.84171300	0.96769200	0.98362400	0.99672600	0.99838100];
blocking_qssf = [0.01076350	0.26511900	0.48611300	0.60813800	0.67913600	0.83756700	0.96788200	0.98379800	0.99676900	0.99836700];
blocking_sdbr = [0.00199820	0.16563700	0.39580000	0.52122400	0.61425500	0.79534800	0.95628300	0.97805500	0.99573400	0.99770900];
blocking_idbr = [0.00313749	0.16362600	0.36363200	0.48421000	0.54504200	0.71196200	0.91090600	0.94818800	0.98659300	0.99252300
];

i = i+1;
figure(i)

semilogx(X,blocking_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_qedf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_qssf,'-+', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)

deadline_static = [0.10704	0.197455	0.21686	0.223207	0.224711	0.231237	0.235002	0.234073	0.235204	0.231075];
deadline_dbr = [0.0972916	0.179437	0.194189	0.204456	0.204417	0.205625	0.206066	0.211377	0.20881	0.208795];
deadline_qedf = [0.0640114	0.151178	0.177467	0.180727	0.1861	0.187316	0.195445	0.196507	0.19444	0.191582];
deadline_qssf = [0.0651616	0.152464	0.173079	0.179832	0.184917	0.190254	0.194581	0.195914	0.19258	0.194804];
deadline_sdbr = [0.0939096	0.22602	0.264516	0.274801	0.283829	0.292517	0.296044	0.295258	0.298705	0.30148];
deadline_idbr = [0.0970713	0.206774	0.223605	0.233376	0.238574	0.262796	0.310443	0.320004	0.333499	0.338226];


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

xlabel('\lambda_\mu','FontSize', 14);
ylabel('P_{miss}','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);
hold off;
grid on;

i = i+1;
figure(i)

V0_static = [0.906795654	1.322998047	1.424060059	1.423010254	1.448498535	1.457189941	1.465026855	1.480725098	1.484008789	1.453491211];
V0_dbr = [0.90456543	1.355041504	1.430383301	1.45604248	1.453161621	1.470544434	1.483166504	1.485546875	1.477929688	1.511499023];
V0_qedf = [0.900582275	1.345849609	1.439477539	1.454943848	1.461791992	1.493273926	1.490270996	1.482958984	1.482739258	1.482800293];
V0_qssf = [0.888995361	1.346386719	1.442504883	1.459204102	1.455200195	1.46862793	1.499084473	1.495300293	1.48548584	1.477368164];
V0_sdbr = [0.872790527	1.544299316	1.717456055	1.754602051	1.792675781	1.83515625	1.861181641	1.868200684	1.899707031	1.89510498];
V0_idbr = [0.883686523	1.491540527	1.639697266	1.767163086	1.8421875	2.000598145	2.317944336	2.396105957	2.525048828	2.535839844];

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

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Average Offloading Volume (GB)','FontSize', 12);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)

VD_static = [261.93875	231.405	230.2125	226.54	224.62375	220.16625	216.175	215.3275	204.2275	203.9325];
VD_dbr = [250.3525	249.84375	229.31375	223.545	221.84625	218.66125	215.0375	213.97375	205.43875	195.91625];
VD_qedf = [257.73625	226.765	225.97125	225.8275	224.49875	224.1425	223.27625	218.64125	207.5175	204.08375];
VD_qssf = [258.37625	229.2675	225.94	222.1425	220.995	219.39875	216.58875	215.04	213.83375	211.9275];
VD_sdbr = [250.62	225.6575	224.185	219.7125	217.3575	216.225	214.06	207.80625	205.52375	200.82625];
VD_idbr = [251.66375	229.25125	224.38125	223.37625	221.1725	220.18	219.85625	218.28625	218.035	212.04875];

semilogx(X,VD_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,VD_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,VD_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,VD_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,VD_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,VD_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Average Download Volume (MB)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);


hold off;
grid on;

 