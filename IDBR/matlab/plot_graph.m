X = [0.01	0.02	0.03	0.04	0.05	0.1	0.5	1	5	10];
Mo_money_static = [406562.00	748068.00	1180710.00	1515900.00	1860580.00	3058110.00	3094660.00	3167850.00	3181500.00	3189780.00];
Mo_money_dbr = [405223.00	795983.00	1189260.00	1527350.00	1871560.00	3035280.00	3168510.00	3183650.00	3210370.00	3270880.00];
Mo_money_qedf = [409004.00	799477.00	1162090.00	1523940.00	1807310.00	2788950.00	2889800.00	2903700.00	2941510.00	2950370.00];
Mo_money_qssf = [403433.00	792325.00	1060410.00	1487680.00	1780880.00	2688630.00	2807550.00	2845990.00	2951320.00	2977320.00];
Mo_money_sdbr = [406951.00	804647.00	1179390.00	1510050.00	1894630.00	2908340.00	3174260.00	3178390.00	3226270.00	3234280.00];
Mo_money_idbr = [410456.00	799323.00	1097510.00	1524190.00	1887100.00	3075390.00	3525900.00	3687340.00	5160470.00	8255260.00];
									
														
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

Mo_puser_static = [13.5264	13.1508	12.6331	12.4711	12.4263	10.6923	6.17435	6.08737	6.03694	6.01965];
Mo_puser_dbr = [13.5608	13.357	13.1322	12.7336	12.5225	10.7407	6.29822	6.20574	6.16882	6.15635];
Mo_puser_qedf = [13.5598	13.2912	12.9621	12.6754	12.0716	9.69287	5.61385	5.54715	5.5425	5.52069];
Mo_puser_qssf = [13.4779	13.2596	12.4292	11.9051	11.7657	9.5688	5.61176	5.57564	5.54159	5.52538];
Mo_puser_sdbr = [13.5904	13.405	13.1235	12.5813	12.5782	10.5992	5.30563	5.24926	5.18438	5.17679];
Mo_puser_idbr = [13.6732	13.3944	12.784	12.578	12.1709	10.2797	6.07857	5.84704	5.13857	4.99183];


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
blocking_static = [0.00000000	0.00000000	0.00000000	0.00004167	0.00000000	0.00440849	0.65667400	0.83033400	0.96500600	0.98306600];
blocking_dbr = [0.00000000	0.00000000	0.00000000	0.00000000	0.00000000	0.00412480	0.65398700	0.82907700	0.96719500	0.98284800];
blocking_qedf = [0.00000000	0.00000000	0.00000000	0.00000000	0.00016696	0.00938318	0.64985100	0.82550900	0.96447500	0.98322500];
blocking_qssf = [0.00000000	0.00000000	0.00000000	0.00000000	0.00002005	0.00787210	0.64627200	0.83218900	0.96763300	0.98219600];
blocking_sdbr = [0.00000000	0.00000000	0.00000000	0.00000000	0.00001328	0.00096948	0.63395600	0.79495500	0.95918300	0.97916900];
blocking_idbr = [0.00000000	0.00000000	0.00000000	0.00000000	0.00000000	0.00087831	0.59591500	0.79871300	0.93304300	0.94488000];

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

deadline_static = [0.0415544	0.0498869	0.0604114	0.0619165	0.0649173	0.116913	0.332559	0.339581	0.344735	0.345909];
deadline_dbr = [0.0417308	0.0445187	0.0492927	0.0550664	0.0606065	0.110647	0.300529	0.307242	0.311073	0.311161];
deadline_qedf = [0.0386566	0.0426759	0.0473381	0.0496057	0.0620709	0.11324	0.300379	0.311784	0.317056	0.318839];
deadline_qssf = [0.0399893	0.0434273	0.0551582	0.0637213	0.0658182	0.115502	0.300422	0.311359	0.317935	0.319562];
deadline_sdbr = [0.0399412	0.0439143	0.0498503	0.0598693	0.0602963	0.116844	0.428153	0.44466	0.46291	0.463561];
deadline_idbr = [0.0386422	0.0459314	0.05581	0.0591207	0.0689105	0.126279	0.3262	0.355336	0.433765	0.453672];


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

V0_static = [20.266875	24.286625	24.874375	25.281875	35.9	46.4225	76.32725	76.729375	78.00575	80.5665];
V0_dbr = [18.407	18.844375	20.771875	22.691	24.04625	35.784375	78.8055	80.0655	81.30075	87.445375];
V0_qedf = [18.107125	19.815125	20.550375	20.568625	28.1775	41.7565	75.6445	77.18425	77.734	81.619];
V0_qssf = [19.5465	22.809625	25.114125	28.752375	43.00175	44.39975	75.073875	77.4255	79.966375	81.482375];
V0_sdbr = [17.607375	18.521	21.273625	23.015	25.998	37.464	100.89175	101.60125	102.84425	104.118375];
V0_idbr = [17.423375	21.5595	22.099125	23.62625	40.07925	42.317875	87.296625	108.229125	143.64	145.48875];

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
ylabel('Average Offloading Volume (MB)','FontSize', 12);

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

 