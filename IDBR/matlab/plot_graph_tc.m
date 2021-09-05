X = [100	250	500	750	1000	2500	5000	7500	10000];

Mo_money_static = [2308890.00	3654130.00	5039140.00	5924950.00	6613520.00	8352550.00	8990820.00	9480610.00	9802120.00];
Mo_money_dbr = [2238160.00	3493610.00	4985780.00	5711680.00	6615580.00	8376220.00	9492760.00	9390140.00	9721370.00];
Mo_money_qedf = [1698580.00	2935710.00	4277750.00	5216530.00	6039510.00	7846980.00	8844380.00	9342860.00	9670720.00];
Mo_money_qssf = [1712490.00	3037750.00	4352850.00	5436760.00	6050100.00	8125980.00	9237660.00	9468520.00	9532720.00];
Mo_money_sdbr = [1800190.00	3159080.00	4979390.00	5587930.00	6703820.00	8389080.00	9564880.00	10219900.00	10354400.00];
Mo_money_idbr = [2479170.00	3885660.00	5616870.00	7077650.00	8071620.00	10993900.00	13728000.00	14345600.00	15493400.00];

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
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

Mo_puser_static = [71.8787	104.371	134.141	150.525	163.104	191.02	202.747	207.381	210.26];
Mo_puser_dbr = [69.9819	100.654	130.957	146.517	159.036	185.866	197.758	200.841	204.007];
Mo_puser_qedf = [53.0276	84.4128	115.024	134.867	146.278	177.94	191.371	195.925	198.288];
Mo_puser_qssf = [53.2408	85.1126	116.817	134.777	147.646	178.53	191.137	196.316	197.98];
Mo_puser_sdbr = [46.6382	75.2161	107.416	123.452	136.662	165.645	179.171	184.755	187.211];
Mo_puser_idbr = [69.3125	93.4569	121.09	135.824	145.779	170.432	183.674	188.29	190.089];

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

blocking_static = [0.892492	0.883079	0.874996	0.868529	0.865058	0.85407	0.851915	0.847658	0.845301];
blocking_dbr = [0.893616	0.884351	0.873344	0.870712	0.861256	0.849795	0.840122	0.844488	0.841298];
blocking_qedf = [0.893297	0.884124	0.875776	0.871378	0.862054	0.852787	0.845611	0.840769	0.836565];
blocking_qssf = [0.892873	0.881063	0.876057	0.865685	0.863341	0.848243	0.839226	0.838875	0.83941];
blocking_sdbr = [0.871218	0.859718	0.845328	0.849097	0.836625	0.83094	0.821522	0.81554	0.815235];
blocking_idbr = [0.880801	0.861025	0.845356	0.825913	0.815405	0.785016	0.75058	0.745803	0.728645];

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

deadline_static = [0.493338	0.402873	0.329234	0.29404	0.268472	0.210973	0.190078	0.178931	0.174607];
deadline_dbr = [0.471328	0.380247	0.302952	0.272375	0.245829	0.20055	0.177701	0.175985	0.171745];
deadline_qedf = [0.440747	0.343263	0.280613	0.248404	0.221662	0.183655	0.166284	0.163004	0.15745];
deadline_qssf = [0.429349	0.340002	0.272556	0.241875	0.221368	0.180684	0.16466	0.160125	0.159792];
deadline_sdbr = [0.68038	0.558	0.439512	0.388167	0.347332	0.258051	0.222707	0.206993	0.201703];
deadline_idbr = [0.523009	0.441374	0.361747	0.318198	0.295021	0.234629	0.202085	0.190592	0.187176];

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

V0_static = [11.4704875	18.579125	23.290125	24.5245	26.573625	30.874125	34.08675	34.15275	41.465375];
V0_dbr = [17.38075	18.72	21.123625	28.160125	28.768625	35.036	35.530125	36.5635	39.9615];
V0_qedf = [10.3853625	19.54925	24.867625	29.717125	29.95625	32.806875	33.350625	35.30475	38.245625];
V0_qssf = [12.989	17.34825	26.6875	27.54025	28.118375	32.884375	34.349875	35.508625	37.713];
V0_sdbr = [14.016875	22.689	24.711625	28.425	31.938125	33.479125	35.603375	43.20975	45.366];
V0_idbr = [12.200625	17.93	20.5135	22.626	24.08825	29.211	31.51475	33.72025	36.029375];

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

 