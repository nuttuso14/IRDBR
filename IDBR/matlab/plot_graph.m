X = [0.01	0.02	0.03	0.04	0.05	0.1	0.5	1	5	10];

Mo_money_static = [455434.00	913306.00	1365740.00	1801230.00	2237910.00	4149130.00	5397940.00	5086510.00	4959800.00	5226610.00];
Mo_money_dbr = [452808.00	912970.00	1368490.00	1795120.00	2224640.00	3993970.00	5386290.00	5668140.00	5273230.00	5868940.00];
Mo_money_qedf = [464056.00	917360.00	1360880.00	1776020.00	2202550.00	3871490.00	5070290.00	4999770.00	4922990.00	5588880.00];
Mo_money_qssf = [462599.00	918638.00	1365670.00	1783410.00	2165350.00	3977250.00	5177110.00	4828700.00	5069510.00	5209620.00];
Mo_money_sdbr = [458577.00	911463.00	1370140.00	1817690.00	2233710.00	4148600.00	5578400.00	5514460.00	5645820.00	5571030.00];
Mo_money_idbr = [462608.00	917312.00	1362500.00	1802470.00	2197260.00	4163650.00	5298310.00	5877090.00	7058620.00	7825000.00];

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
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

Mo_puser_static = [15.3391	15.2788	15.2239	15.0586	14.8884	13.9761	12.2848	12.261	12.237	12.2222];
Mo_puser_dbr = [15.3276	15.2411	15.1916	14.9997	14.9005	13.6669	12.2636	12.2424	12.2032	12.2344];
Mo_puser_qedf = [15.4541	15.1906	15.1404	14.8103	14.7065	13.3245	11.3654	11.3067	11.2326	11.1889];
Mo_puser_qssf = [15.3759	15.2474	15.1812	14.8116	14.5572	13.5572	11.3724	11.2727	11.2126	11.1907];
Mo_puser_sdbr = [15.3942	15.247	15.218	15.068	14.9449	13.9028	11.4745	11.2714	11.1502	11.1279];
Mo_puser_idbr = [15.4811	15.3294	15.1194	15.0785	14.7373	13.9564	11.9522	11.748	11.3234	11.2367];

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

blocking_static = [0.00000000	0.00000000	0.00000000	0.00000000	0.00000665	0.00889361	0.70660600	0.86169400	0.97297500	0.98575100];
blocking_dbr = [0.00000000	0.00000000	0.00000000	0.00002507	0.00000000	0.02496340	0.70682500	0.84569600	0.97120300	0.98401100];
blocking_qedf = [0.00000000	0.00000000	0.00000000	0.00001668	0.00016022	0.02811370	0.70277600	0.85259200	0.97078000	0.98334700];
blocking_qssf = [0	0	0	0.000132866	0.000215074	0.0228649	0.696512	0.857237	0.969857	0.984482];
blocking_sdbr = [0.00000000	0.00000000	0.00000000	0.00000000	0.00002007	0.00461660	0.67594300	0.83688600	0.96624500	0.98331800];
blocking_idbr = [0	0	0	0	0	0.00545718	0.704406	0.833247	0.958444	0.976783];

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

deadline_static = [0.00508572	0.00617305	0.00792554	0.00858588	0.0103451	0.0234982	0.0703666	0.071389	0.0721146	0.0733035];
deadline_dbr = [0.00565297	0.00709492	0.0077485	0.00925825	0.0100268	0.0290175	0.0677013	0.0690529	0.0700571	0.0708461];
deadline_qedf = [0.00572799	0.00744293	0.0075178	0.00806384	0.00836633	0.0143037	0.022088	0.0232272	0.0235619	0.024594];
deadline_qssf = [0.00591637	0.00650633	0.00701438	0.00806438	0.00839003	0.0126735	0.0230876	0.0233725	0.0235576	0.0249326];
deadline_sdbr = [0.00614321	0.00744396	0.00746385	0.00913522	0.00986197	0.0248793	0.11246	0.128275	0.13721	0.137392];
deadline_idbr = [0.00635834	0.00705214	0.00782325	0.00901798	0.0110064	0.0237554	0.0690764	0.0789748	0.108529	0.114844];

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

i = i+1;
figure(i)

V0_static = [13.225375	14.685	15.565625	16.37125	17.858375	27.74375	56.042	57.302125	57.922625	58.119375];
V0_dbr = [12.879625	14.479	15.018125	18.573	18.758875	36.926375	58.187	58.549125	59.585	59.596375];
V0_qedf = [13.37325	15.1735	16.22325	18.497375	19.304	33.373	53.983	56.04675	57.156875	57.31175];
V0_qssf = [13.664375	14.79525	15.964875	18.923625	21.712375	30.702	55.211	56.121625	56.853625	57.025875];
V0_sdbr = [13.3455	14.525625	14.996625	16.86025	17.581625	31.034125	68.01225	74.964875	77.37525	79.380875];
V0_idbr = [14.252875	14.998375	15.77575	16.57575	20.461625	30.051375	75.16425	97.337125	122.992625	130.46];

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
ylabel('Average Offloading Volume (MB)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

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

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',2,'FontSize', 13);

hold off;
grid on;

 