X = [0.01	0.02	0.03	0.04	0.05	0.1	0.5	1	5	10];

Mo_money_static = [7749390.00	8596590.00	8361790.00	8459360.00	8451730.00	8414500.00	8344650.00	8270210.00	8463610.00	8426880.00];
Mo_money_dbr = [7658840.00	8263170.00	8072110.00	8341610.00	8113710.00	8178030.00	8368040.00	8525140.00	7960350.00	8460260.00];
Mo_money_sdbr = [7830050.00	7542180.00	7866540.00	8364150.00	8419190.00	8650640.00	9104290.00	9165140.00	9152840.00	8908060.00];
Mo_money_idbr = [7871160.00	8198820.00	8218390.00	8538410.00	9187380.00	10709500.00	15866000.00	17610400.00	19561400.00	21517200.00];

i = i+1;
figure(i)

semilogx(X,Mo_money_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_money_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;


Mo_puser_static = [0.0195595	0.292637	0.522473	0.635219	0.703028	0.853209	0.970576	0.99	0.997002	0.998523];
Mo_puser_dbr = [0.017190	0.294910	0.518747	0.624641	0.704325	0.849783	0.96935	0.984409	0.997059	0.998449];
Mo_puser_sdbr = [0.00199588	0.26	0.47	0.57	0.66	0.82	0.96	1	0.996266	0.998177];
Mo_puser_idbr = [0.004776	0.258061	0.489608	0.601787	0.652444	0.790461	0.935667	0.963977	0.991889	0.995539];

i = i+1;
figure(i)

semilogx(X,Mo_puser_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,Mo_puser_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Average User Payment ($)','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);

legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;

blocking_static = [0.00000000	0.00000000	0.00000000	0.00000000	0.00000665	0.00889361	0.70660600	0.86169400	0.97297500	0.98575100];
blocking_dbr = [0.00000000	0.00000000	0.00000000	0.00002507	0.00000000	0.02496340	0.70682500	0.84569600	0.97120300	0.98401100];
blocking_sdbr = [0.00000000	0.00000000	0.00000000	0.00000000	0.00002007	0.00461660	0.67594300	0.83688600	0.96624500	0.98331800];
blocking_idbr = [0	0	0	0	0	0.00545718	0.704406	0.833247	0.958444	0.976783];

i = i+1;
figure(i)

semilogx(X,blocking_static,'-*', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_dbr,'-s', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_sdbr,'-o', 'MarkerSize',9, 'LineWidth',1.1)
hold on
semilogx(X,blocking_idbr,'-^', 'MarkerSize',9, 'LineWidth',1.1)
hold on

xlabel('\lambda_\mu','FontSize', 14);
ylabel('Blocking Probability','FontSize', 15);

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', X);
legend({'Static','DBR','SDBR','IDBR'},'NumColumns',1,'FontSize', 15);

hold off;
grid on;



 