X = [0.25	0.5	0.75	1	2	4	5];

Mo_money_static = [3166130.00	2934730.00	2905980.00	2775390.00	2398670.00	2338590.00	1946410.00];
Mo_money_dbr = [3191530.00	2943280.00	2828020.00	2410860.00	2393520.00	2104170.00	2041460.00];
Mo_money_qedf = [3030270.00	2758770.00	2707110.00	2443120.00	2200350.00	1853690.00	1547020.00];
Mo_money_qssf = [2849700.00	2686930.00	2639070.00	2472340.00	2059240.00	2020620.00	1733540.00];
Mo_money_sdbr = [3178040.00	2838740.00	2838520.00	2569410.00	2540800.00	2377040.00	2159420.00];
Mo_money_idbr = [3208130.00	3124660.00	3055190.00	2930420.00	2668130.00	2598970.00	2416080.00];
				
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

						
Mo_puser_static = [10.5874	9.89272	9.77768	9.35249	8.16939	8.04925	6.8334];
Mo_puser_dbr = [10.9769	9.90973	9.53757	8.34098	8.15982	7.34075	7.23527];
Mo_puser_qedf = [10.1444	9.26718	9.11213	8.26485	7.48919	6.35417	5.44486];
Mo_puser_qssf = [9.57805	9.05165	8.87589	8.38364	7.10151	6.91618	6.01192];
Mo_puser_sdbr = [10.5946	9.51376	9.5114	8.65243	8.55376	8.04222	7.46508];
Mo_puser_idbr = [10.7121	10.4235	10.2233	9.83805	8.96595	8.7435	8.19362];

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

blocking_static = [0.00338921	0.00866560	0.00948924	0.01342450	0.02433680	0.02888510	0.05093860];
blocking_dbr = [0.00214958	0.00960276	0.01007220	0.02096340	0.03155810	0.04420360	0.05892080];
blocking_qedf = [0.00281416	0.00684950	0.00795452	0.01543110	0.01986600	0.02962370	0.05515150];
blocking_qssf = [0.00775553	0.00820372	0.01069140	0.01606500	0.02534350	0.03035890	0.03975200];
blocking_sdbr = [0.00045317	0.00352327	0.00541221	0.00956274	0.01204340	0.01900060	0.03598530];
blocking_idbr = [0.00075334	0.00105069	0.00179368	0.00548223	0.00579968	0.01126620	0.01808820];

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

deadline_static = [0.120178	0.142482	0.14593	0.160203	0.19958	0.207923	0.258357];
deadline_dbr = [0.102523	0.136289	0.147963	0.194729	0.197494	0.233706	0.239057];
deadline_qedf = [0.0968722	0.117254	0.118015	0.14288	0.157446	0.185813	0.222719];
deadline_qssf = [0.115634	0.120284	0.125194	0.139888	0.17	0.174651	0.200274];
deadline_sdbr = [0.114879	0.150662	0.151796	0.184915	0.188329	0.205687	0.237554];
deadline_idbr = [0.113888	0.118297	0.126928	0.141597	0.168006	0.175841	0.194982];

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

V0_static = [36.955125	35.088125	28.892	26.672375	19.92125	12.537875	11.3885125];
V0_dbr = [47.112875	33.643125	29.4225	26.74225	24.9795	12.519125	12.008225];
V0_qedf = [35.865625	33.8395	28.339875	27.579875	18.86175	15.300125	10.0236375];
V0_qssf = [43.389875	36.092	33.419125	23.74175	21.19125	11.1350125	10.9204125];
V0_sdbr = [40.293	38.394625	37.18625	27.357625	19.99725	14.808625	10.0969625];
V0_idbr = [37.856875	33.978375	31.40925	30.841	29.155375	19.6605	9.8777];

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

 