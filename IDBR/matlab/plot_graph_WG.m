X = [5 10 20 40 80 100];

Mo_money_static = [1643530	2901740	4132890	4535180	4659660	4687310];
Mo_money_dbr = [1560040	2746240	4100630	4525280	4684920	4708300];
Mo_money_qedf = [1403640	2480470	3920860	4475330	4679740	4682190];
Mo_money_qssf = [1538920	2343380	3868800	4478430	4654740	4675340];
Mo_money_sdbr = [1645450	2881370	4118310	4520010	4679000	4697890];
Mo_money_idbr = [1591900	2664000	4113400	4540280	4673470	4701790];

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

xlabel('w_g (Unit: Mbps)','FontSize', 14);
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15);

xticklabels({'5', '10', '20', '40', '80', '100'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

Mo_puser_static = [95.3389	103.343	116.887	133.832	149.134	153.885];
Mo_puser_dbr = [96.3939	103.105	115.435	132.28	147.704	152.233];
Mo_puser_qedf = [94.5756	100.095	107.663	122.645	142.299	148.501];
Mo_puser_qssf = [95.0934	99.7837	107.898	123.162	141.936	149.048];
Mo_puser_sdbr = [92.5681	96.8364	106.2	121.089	140.67	147.646];
Mo_puser_idbr = [93.6922	99.6916	108.925	125.596	143.556	149.625];


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

xlabel('w_g (Unit: Mbps)','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'5', '10', '20', '40', '80', '100'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

blocking_static = [0.443640	0.171136	0.009333	0.000017	0.000000	0.000000];
blocking_dbr = [0.483576	0.211513	0.009659	0.000047	0.000000	0.000000];
blocking_qedf = [0.493404	0.225792	0.025485	0.002421	0.000570	0.000331];
blocking_qssf = [0.449858	0.262541	0.031825	0.002300	0.000660	0.000313];
blocking_sdbr = [0.410721	0.145221	0.004393	0.000000	0.000000	0.000000];
blocking_idbr = [0.461068	0.213396	0.008334	0.000020	0.000000	0.000000];

i = i+1;
figure(i)

semilogx(X,blocking_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_qssf,'-p', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('w_g (Unit: Mbps)','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'5', '10', '20', '40', '80', '100'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

deadline_static = [0.212968	0.102525	0.0246095	0.00494864	0.00164094	0.00118705];
deadline_dbr = [0.20158	0.103514	0.0254823	0.00446891	0.0013791	0.000993298];
deadline_qedf = [0.191044	0.0653722	0.0135691	0.00352266	0.00122796	0.000881772];
deadline_qssf = [0.185969	0.0712533	0.0145321	0.00369995	0.00133503	0.000993313];
deadline_sdbr = [0.279331	0.128166	0.0250561	0.00521943	0.00148315	0.00109187];
deadline_idbr = [0.209173	0.119662	0.025919	0.00472042	0.00167888	0.00112845];


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

xlabel('w_g (Unit: Mbps)','FontSize', 14);
ylabel('P_{miss}','FontSize', 15);

xticklabels({'5', '10', '20', '40', '80', '100'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

V0_static = [99.24	64.88	29.29	10.69	5.15	3.69];
V0_dbr = [110.75	72.78	31.76	11.05	4.79	3.62];
V0_qedf = [108.58	70.75	32.43	13.35	5.38	4.19];
V0_qssf = [100.71	75.01	33.82	12.83	5.59	4.53];
V0_sdbr = [133.26	76.69	31.60	11.33	4.76	3.74];
V0_idbr = [124.45	78.91	31.98	10.61	4.79	3.71];

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

xlabel('w_g (Unit: Mbps)','FontSize', 14);
ylabel('Average Offloading Volume (GB)','FontSize', 15);

xticklabels({'5', '10', '20', '40', '80', '100'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

VD_static = [210.75	212.60	222.33	224.28	229.05	258.44];
VD_dbr = [208.91	219.89	222.03	226.16	228.82	230.68];
VD_qedf = [213.19	213.53	230.13	230.48	232.01	237.87];
VD_qssf = [214.10	223.71	224.74	229.99	243.34	253.84];
VD_sdbr = [211.58	222.86	224.01	224.45	230.33	233.19];
VD_idbr = [208.88	211.84	223.58	224.27	224.77	226.39];

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

xlabel('w_g (Unit: Mbps)','FontSize', 14);
ylabel('Average Download Volume (GB)','FontSize', 15);

xticklabels({'5', '10', '20', '40', '80', '100'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;
 