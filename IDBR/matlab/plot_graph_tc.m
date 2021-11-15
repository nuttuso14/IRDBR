X = [100	250	500	750	1000	2500	5000	7500	10000];

Mo_money_static = [1862890.00	2189790.00	2308880.00	2494900.00	2771350.00	2871520.00	2954450.00	3033700.00	3096350.00];
Mo_money_dbr = [1197630.00	2410410.00	2485370.00	2644560.00	2709540.00	2742530.00	2956530.00	2983500.00	3062690.00];
Mo_money_qedf = [1815520.00	2031020.00	2201670.00	2566730.00	2609830.00	2817730.00	2819370.00	2890270.00	2981110.00];
Mo_money_qssf = [862141.00	1744980.00	2325030.00	2330900.00	2370690.00	2616360.00	2705400.00	2749880.00	2891720.00];
Mo_money_sdbr = [1990920.00	2403060.00	2543280.00	2617700.00	2833920.00	2922360.00	3043470.00	3053930.00	3070080.00];
Mo_money_idbr = [2046580.00	2220190.00	2356320.00	2715300.00	2721690.00	2914450.00	3040950.00	3089620.00	3131120.00];


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

xlabel('E[T_C] (Unit: seconds)','FontSize', 14);
ylabel('Mobile Operator Revenue ($)','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

Mo_puser_static = [7.5114	8.46712	8.83651	9.5587	10.174	10.5616	11.1582	11.2303	11.2516];
Mo_puser_dbr = [8.55309	9.07299	9.76886	10.0396	10.0691	10.6414	10.698	10.6971	10.9682];
Mo_puser_qedf = [6.47779	7.80571	8.30843	8.44331	9.02921	9.96094	10.2594	10.6501	10.6185];
Mo_puser_qssf = [6.13703	7.72184	8.34493	8.97271	9.38954	9.49871	10.1444	10.5161	10.5758];
Mo_puser_sdbr = [8.07971	7.26214	9.23783	10.2297	10.4004	10.6521	10.6714	10.7686	11.0699];
Mo_puser_idbr = [8.45226	8.52381	9.57659	10.1669	10.1045	10.2974	10.6808	11.2536	11.3648];

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

xlabel('E[T_C] (Unit: seconds)','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

blocking_static = [0.04209570	0.02649600	0.01677280	0.01343900	0.00717271	0.00491653	0.00273105	0.00241622	0.00152381];
blocking_dbr = [0.01784860	0.01741780	0.00987634	0.00947399	0.00864051	0.00848856	0.00313333	0.00574898	0.00347553];
blocking_qedf = [0.03012970	0.01449610	0.01345970	0.01540450	0.01445500	0.00528860	0.00404192	0.00275617	0.00261287];
blocking_qssf = [0.03650010	0.01695280	0.01475260	0.00947747	0.01017950	0.01891410	0.00525666	0.00235623	0.00325012];
blocking_sdbr = [0.01350270	0.02011150	0.00414888	0.00177660	0.00153336	0.00084465	0.00124116	0.00051816	0.00010012];
blocking_idbr = [0.00878741	0.01118670	0.00370573	0.00097823	0.00129715	0.00135930	0.00100710	0.00013338	0.00016022];


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

xlabel('E[T_C] (Unit: seconds)','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)


deadline_static = [0.228667	0.192242	0.17783	0.15627	0.131556	0.121579	0.104098	0.101473	0.100236];
deadline_dbr = [0.180048	0.163126	0.139314	0.134107	0.131397	0.114953	0.113427	0.114417	0.104944];
deadline_qedf = [0.182798	0.146821	0.140362	0.14256	0.129182	0.110578	0.0986312	0.0915974	0.0915902];
deadline_qssf = [0.195471	0.149974	0.140665	0.125864	0.117853	0.129927	0.100371	0.0932958	0.0941662];
deadline_sdbr = [0.202826	0.239961	0.159818	0.127192	0.120819	0.116066	0.115206	0.112548	0.101876];
deadline_idbr = [0.180557	0.184678	0.148945	0.128213	0.131488	0.128903	0.114629	0.0985507	0.0952831];

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

xlabel('E[T_C] (Unit: seconds)','FontSize', 14);
ylabel('P_{miss}','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)

V0_static = [18.160125	27.424	33.01725	34.872625	36.517	37.085125	40.128625	40.18275	41.605625];
V0_dbr = [16.9345	25.165	29.0745	33.31825	38.110375	43.262	43.644875	45.503875	49.192];
V0_qedf = [19.380375	23.4475	31.855625	39.121125	40.465	40.700375	41.0425	41.828125	48.37425];
V0_qssf = [21.4905	24.588375	32.864375	35.076125	36.77975	40.757875	41.002875	44.01875	60.0495];
V0_sdbr = [19.109375	29.581875	34.233875	34.789625	37.373625	41.30225	42.03825	47.142375	47.835375];
V0_idbr = [17.506	28.96325	31.649375	32.326125	37.559125	38.811125	40.8135	42.046125	49.765375];

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

xlabel('E[T_C] (Unit: seconds)','FontSize', 14);
ylabel('Average Offloading Volume (MB)','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)

VD_static = [221.94	224.01625	225.165	226.4625	226.9125	231.3625	231.715	234.7525	248.665];
VD_dbr = [212.13	221.24125	223.46375	226.25375	231.12375	234.89375	237.9825	239.07125	249.2325];
VD_qedf = [209.98	219.47625	221.365	223.82625	235.68125	238.17875	238.91625	245.79	250.72625];
VD_qssf = [213.4575	215.86	217.6025	220.18375	221.87625	229.48625	232.515	240.04375	246.56125];
VD_sdbr = [222.15	226.39625	227.57	228.3125	232.83875	234.91125	250.54375	252.41875	255.9925];
VD_idbr = [206.44125	210.4125	210.70875	215.91375	218.15625	219.565	220.82	222.92625	225.29375];

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

xlabel('E[T_C] (Unit: seconds)','FontSize', 14);
ylabel('Average Download Volume (MB)','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

 