X = [100	250	500	750	1000	2500	5000	7500	10000];

Mo_money_static = [4244910.00	4133500.00	4153590.00	3986560.00	3964230.00	3930000.00	3241220.00	3763450.00	3783710.00];
Mo_money_dbr = [4109440.00	4133630.00	3739080.00	3919520.00	3937170.00	3906350.00	3740510.00	3818510.00	3636500.00];
Mo_money_qedf = [4075000.00	3929340.00	3824830.00	3882470.00	3863110.00	3560150.00	3237760.00	3372300.00	3310600.00];
Mo_money_qssf = [4110490.00	4015230.00	3911620.00	3692090.00	3868500.00	3569240.00	3334600.00	3393920.00	3234850.00];
Mo_money_sdbr = [4221390.00	4171220.00	4073330.00	4035610.00	4080840.00	3848200.00	3960880.00	3488570.00	3717060.00];
Mo_money_idbr = [4248230.00	4204200.00	4142140.00	3900740.00	4119850.00	3695540.00	3918860.00	3838850.00	3658540.00];

i = i+1;
figure(i)

semilogx(X,Mo_money_static,'-x', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_qssf,'-+', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[T_0] (Unit: seconds)','FontSize', 14);
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'Static','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

Mo_puser_static = [14.2026	13.9242	13.9601	13.5916	13.5317	13.4261	12.2022	13.0043	13.139];
Mo_puser_dbr = [13.8218	13.9086	13.1952	13.3472	13.4525	13.3458	12.9884	13.1011	12.8361];
Mo_puser_qedf = [13.7762	13.4925	13.1926	13.335	13.3025	12.626	11.9089	12.2656	12.1514];
Mo_puser_qssf = [13.8679	13.6049	13.4103	12.92	13.3225	12.6441	12.135	12.245	11.9412];
Mo_puser_sdbr = [14.1315	14.0162	13.6661	13.6427	13.7248	13.124	13.3799	12.4712	12.8261];
Mo_puser_idbr = [14.0904	14.0515	13.8618	13.4205	13.7925	12.7646	13.3218	13.0964	12.7688];

i = i+1;
figure(i)

semilogx(X,Mo_puser_static,'-x', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_qssf,'-+', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[T_0] (Unit: seconds)','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'Static','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

blocking_static = [0.00347088	0.01123470	0.01067340	0.02100440	0.02236500	0.02254660	0.11602500	0.03528180	0.03682420];
blocking_dbr = [0.01070420	0.00938617	0.05515010	0.02292110	0.02320850	0.02231580	0.03969110	0.02853380	0.05393650];
blocking_qedf = [0.01313460	0.02687240	0.03193440	0.02931570	0.02868730	0.05730300	0.09149900	0.07929140	0.09159200];
blocking_qssf = [0.0108061	0.0175726	0.0251884	0.0453653	0.0289788	0.0561362	0.0837748	0.0773085	0.0985028];
blocking_sdbr = [0.00256435	0.00411596	0.00900670	0.01150190	0.00714572	0.02221820	0.01334160	0.06516280	0.03597870];
blocking_idbr = [0.00399186	0.00181154	0.00416563	0.0310459	0.00660479	0.0334642	0.016331	0.0221733	0.0460478];

i = i+1;
figure(i)

semilogx(X,blocking_static,'-x', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_qssf,'-+', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[T_0] (Unit: seconds)','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'Static','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

deadline_static = [0.0204127	0.0248435	0.0234057	0.0296273	0.0298164	0.0306784	0.0519977	0.0352072	0.0337528];
deadline_dbr = [0.0256462	0.0239469	0.0375733	0.0321769	0.0306522	0.0309188	0.0360189	0.0331359	0.0388277];
deadline_qedf = [0.0129986	0.0148648	0.0148833	0.013117	0.0123931	0.0134235	0.0147346	0.0134575	0.0137164];
deadline_qssf = [0.0125977	0.0134143	0.0133773	0.0149563	0.0123358	0.0132065	0.0142799	0.0133889	0.0143374];
deadline_sdbr = [0.0211166	0.0226176	0.0289269	0.02838	0.0260482	0.0352876	0.0300879	0.0461373	0.0388469];
deadline_idbr = [0.0217305	0.0212433	0.0242188	0.0334313	0.0247236	0.0416488	0.0313866	0.0335149	0.0391453];

semilogx(X,deadline_static,'-x', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_qssf,'-+', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,deadline_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[T_0] (Unit: seconds)','FontSize', 14);
ylabel('P_{miss}','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'Static','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

V0_static = [30.64075	32.742625	27.284125	29.6465	25.96725	16.210375	15.766875	7.994775	5.95185];
V0_dbr = [40.499875	34.267125	41.742875	31.925	29.537	17.93525	12.3305125	8.5415	7.09255];
V0_qedf = [36.4405	38.020125	34.023125	27.392625	23.549	16.39525	12.25235	7.49495	6.0634];
V0_qssf = [34.705875	34.63725	31.036375	30.389125	23.46425	16.504125	11.466225	7.4208625	6.3428625];
V0_sdbr = [34.34325	32.674875	32.868375	29.959625	25.17175	19.65075	10.4162125	10.2071625	7.2335125];
V0_idbr = [33.953	30.2155	29.204375	33.494875	23.879375	21.396875	10.4229625	8.1096375	7.1285625];

semilogx(X,V0_static,'-x', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_qssf,'-+', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,V0_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('E[T_0] (Unit: seconds)','FontSize', 14);
ylabel('Average Offloading Volume (MB)','FontSize', 15);

xticklabels({'100','250','500','750','1000','2500','5000','7500','10000'});
set(gca, 'XTick', X);

legend({'Static','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;


% VD_dbr = [2.951635742	3.066235352	3.003063965	2.994946289	2.988635254	3.01907959	3.022363281	3.022729492	2.961645508	2.959936523];
% VD_qedf = [2.966003418	2.972399902	2.974023438	2.947741699	3.025537109	3.015930176	2.956408691	3.034912109	3.032397461	2.999133301];
% VD_qssf = [3.042492676	3.002331543	2.97199707	2.933203125	2.981542969	2.991699219	3.071472168	2.969189453	2.943408203	2.997045898];
% VD_sdbr = [2.982910156	2.968261719	2.931311035	2.986621094	2.961816406	2.984716797	3.061206055	3.011779785	2.986560059	2.991308594];
% VD_idbr = [2.973913574	3.022192383	3.017871094	2.999060059	2.979626465	3.002429199	2.970251465	2.988220215	2.971887207	2.987878418];
% 
% semilogx(X,VD_static,'-x', 'MarkerSize',9, 'LineWidth',1.1)
% hold on
% semilogx(X,VD_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
% hold on
% semilogx(X,VD_qedf,'-d', 'MarkerSize',9, 'LineWidth',1.1)
% hold on
% semilogx(X,VD_qssf,'-+', 'MarkerSize',9, 'LineWidth',1.1)
% hold on
% semilogx(X,VD_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
% hold on
% semilogx(X,VD_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
% hold on
% 
% xlabel('\lambda_\mu','FontSize', 14);
% ylabel('Average Download Volume (GB)','FontSize', 15);
% 
% xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
% set(gca, 'XTick', X);
% 
% legend({'Static','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);
% 
% hold off;
% grid on;

 