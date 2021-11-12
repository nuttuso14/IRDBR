X = [100	250	500	750	1000	2500	5000	7500	10000];

Mo_money_static = [2445320	4011730	5467000	6462470	7293660	9399350	10977400	11002000	11256300];
Mo_money_dbr = [2514120	3969510	5497770	6800100	7630080	9493140	10745200	11311200	11572600];
Mo_money_qedf = [1829600	3203700	4763020	5850730	6880480	8971820	10135000	10667700	10794000];
Mo_money_qssf = [1823530	3168830	4799070	5930530	6572000	8970070	10103900	10839600	10958900];
Mo_money_sdbr = [2028880	3704180	5714830	7054240	7907170	10885100	12169100	12555400	13119400];
Mo_money_idbr = [3147470	5525130	7973840	9853630	11123800	15328500	17703600	19468700	19886500];

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

Mo_puser_static = [72.2955	105.583	134.682	151.388	163.656	190.124	203.954	207.636	210.777];
Mo_puser_dbr = [73.9274	105.222	135.087	152.411	163.788	189.81	202.649	207.31	210.139];
Mo_puser_qedf = [53.1398	84.228	116.381	134.931	148.248	178.147	190.834	195.825	197.797];
Mo_puser_qssf = [53.0358	84.4007	116.508	135.003	147.061	177.643	191.156	196.533	198.391];
Mo_puser_sdbr = [46.9963	76.0611	105.521	124.618	136.587	166.337	179.775	185.394	187.616];
Mo_puser_idbr = [55.184	82.62	110.998	128.597	139.578	167.662	180.044	185.542	187.647];

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

blocking_static = [0.88734400	0.87348600	0.86466300	0.85752600	0.85157800	0.83519700	0.82030900	0.82332000	0.82244300];
blocking_dbr = [0.886900	0.874399	0.864047	0.851282	0.844268	0.833074	0.823221	0.818150	0.817112];
blocking_qedf = [0.885377	0.873112	0.863519	0.854931	0.845400	0.831637	0.822001	0.818471	0.818298];
blocking_qssf = [0.885439	0.874947	0.862767	0.853254	0.851399	0.831511	0.824074	0.815922	0.816052];
blocking_sdbr = [0.855779	0.837550	0.819730	0.811871	0.806793	0.781133	0.774703	0.774327	0.766686];
blocking_idbr = [0.80936	0.77665	0.76020	0.74452	0.73360	0.69401	0.67245	0.65025	0.64632];


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

deadline_static = [0.492077	0.395989	0.328735	0.292939	0.264927	0.209636	0.184252	0.179742	0.174631];
deadline_dbr = [0.445248	0.357932	0.290899	0.255486	0.233487	0.194406	0.174449	0.168725	0.162191];
deadline_qedf = [0.433198	0.338758	0.268949	0.238048	0.213415	0.17545	0.156866	0.152361	0.150245];
deadline_qssf = [0.427799	0.334852	0.270957	0.23925	0.21757	0.173483	0.158692	0.150415	0.14841];
deadline_sdbr = [0.678858	0.551951	0.447247	0.381843	0.344406	0.25596	0.220177	0.206149	0.200337];
deadline_idbr = [0.602128	0.494482	0.400624	0.345688	0.313429	0.239956	0.209053	0.194522	0.190172];
																										
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

V0_static = [0.851947021	1.026002197	1.212189941	1.307373047	1.370288086	1.524084473	1.571179199	1.61229248	1.637744141];
V0_dbr = [0.850604248	1.050849609	1.238232422	1.303540039	1.371630859	1.541345215	1.596557617	1.609753418	1.631982422];
V0_qedf = [0.82729248	1.020515137	1.196413574	1.309484863	1.362463379	1.540844727	1.614916992	1.634655762	1.655065918];
V0_qssf = [0.828978271	1.036842041	1.211867676	1.309191895	1.380627441	1.53338623	1.615930176	1.625585938	1.648376465];
V0_sdbr = [1.290539551	1.468737793	1.603259277	1.702868652	1.751159668	1.855651855	1.919946289	1.957629395	1.946276855];
V0_idbr = [1.49765625	1.630187988	1.802880859	1.849597168	1.921643066	2.052575684	2.128833008	2.123303223	2.156860352];


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
ylabel('Average Offloading Volume (GB)','FontSize', 15);

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

 