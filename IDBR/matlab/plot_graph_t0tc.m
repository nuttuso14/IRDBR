X = [0.25	0.5	0.75	1	2	4	5];

Mo_money_static = [4166500	4163380	4139730	4073280	4038360	3713690	3480630];
Mo_money_dbr = [4227600	4085370	3969820.00	3966720	3957400	3491010	3471960];
Mo_money_qedf = [3967310	3861220	3789630	3718120	3503980	3419870	3233920];
Mo_money_qssf = [4079230	3926290	3825080	3637540	3527610	3379880	3373120];
Mo_money_sdbr = [4212620	4137320	4106740	4011930	3732720	3664230	3401150];
Mo_money_idbr = [4229000	4141430	4134430	4051350	3897360	3765830	3744700];

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

xlabel('E[T_0] (Unit: E[T_C])','FontSize', 14);
ylabel('Mobile Operator Revenue ($)','FontSize', 15);

xticklabels({'0.25','0.5','0.75','1','2','4','5'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

Mo_puser_static = [13.9924	13.9906	13.9161	13.7298	13.6115	12.8931	12.3926];
Mo_puser_dbr = [14.1366	13.7936	13.5138	13.4638	13.4481	13.2663	12.502];
Mo_puser_qedf = [13.4731	13.2259	13.0031	12.9307	12.5104	12.29	11.9263];
Mo_puser_qssf = [13.7409	13.4315	13.1745	12.8037	12.5666	12.222	12.1939];
Mo_puser_sdbr = [14.0642	13.815	13.7509	13.5175	12.8694	12.6369	12.2547];
Mo_puser_idbr = [14.1012	13.8732	13.8553	13.5746	13.217	12.8975	12.8373];


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

xlabel('E[T_0] (Unit: E[T_C])','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'0.25','0.5','0.75','1','2','4','5'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

blocking_static = [0.00464244	0.00517897	0.00672806	0.00952801	0.01332580	0.03896930	0.06300810];
blocking_dbr = [0.00289735	0.010090	0.01624620	0.019091	0.021896	0.023704	0.074421];
blocking_qedf = [0.019565	0.028029	0.032702	0.041280	0.065570	0.0737835	0.097856];
blocking_qssf = [0.011119	0.021254	0.031638	0.048223	0.062152	0.077037	0.078892];
blocking_sdbr = [0.000294	0.002295	0.00503057	0.011760	0.030648	0.032241	0.075151];
blocking_idbr = [0.000537	0.001465	0.002247	0.007684	0.018127	0.026697	0.027069];

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

xlabel('E[T_0] (Unit: E[T_C])','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'0.25','0.5','0.75','1','2','4','5'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)

deadline_static = [0.0195126	0.0205112	0.0216723	0.0234499	0.0264589	0.0361099	0.0442458];
deadline_dbr = [0.0180569	0.0224256	0.0274726	0.0278889	0.0287539	0.0305046	0.0434949];
deadline_qedf = [0.011139	0.0117557	0.0129059	0.0129353	0.0131098	0.0140767	0.0142018];
deadline_qssf = [0.0107758	0.011183	0.0119412	0.0125324	0.0128589	0.0129813	0.0131226];
deadline_sdbr = [0.0183655	0.0230867	0.0235826	0.0275678	0.0368664	0.0443299	0.0483249];
deadline_idbr = [0.0177757	0.020203	0.0211159	0.0269793	0.0316947	0.0366358	0.0384704];

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

xlabel('E[T_0] (Unit: E[T_C])','FontSize', 14);
ylabel('P_{miss}','FontSize', 15);

xticklabels({'0.25','0.5','0.75','1','2','4','5'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

i = i+1;
figure(i)

V0_static = [39.303125	29.76575	27.91425	26.840875	15.123375	12.717125	12.1701875];
V0_dbr = [48.97025	36.400125	32.094875	30.97125	20.530625	19.008	10.0797];
V0_qedf = [51.22	31.809625	28.227125	27.457625	20.29275	11.3842125	10.957475];
V0_qssf = [37.232375	33.087	30.10075	29.31775	19.091125	11.450975	9.25955];
V0_sdbr = [45.83925	37.570625	37.220875	27.417625	19.362125	16.86925	15.103875];
V0_idbr = [36.577625	35.545875	32.890375	28.06575	27.033125	21.569875	18.75865];

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

xlabel('E[T_0] (Unit: E[T_C])','FontSize', 14);
ylabel('Average Offloading Volume (MB)','FontSize', 15);

xticklabels({'0.25','0.5','0.75','1','2','4','5'});
set(gca, 'XTick', X);

legend({'M-Offloading','DBR', 'QEDF', 'QSSF','SDBR','IDBR'},'NumColumns',1,'FontSize', 10);

hold off;
grid on;

 