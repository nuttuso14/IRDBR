x_label = [0.01 0.02 0.03 0.04 0.05 0.1 0.5 1 5 10];

%color_table = [1 0 0 ; 0 1 0 ;1 0 0 ; 0 1 0 ;1 0 0 ; 0 1 0 ;];
color_table = [1 0 0 ; 0 1 0 ;0 0 1; 1 0 0 ;0 1 0 ; 0 0 1 ;];
marker_table = ["d","s","o","d","s","o"];
line_style_table = ["-","--","-","--","-","--"];

%% for Overall revenue

%y_SDBR = [7637490	14402600	20324900	25434500	29520300	40275000	46552800	47495400	47658900.00	48021400];
%y_SDBRMultiple = [7630140	14311000	20367300	25039100	29242000	38694200	44627200	45020200	45364000.00	45627800];
%y_SDBRMultipleSelection = [7543620	14065700	19241100	22573800	24170000	25575600	27689300	28421100.00	28518600	28833200];

%y_IDBR = [7745160	14497800	20265200	25318100	29512200	38251300	48810300	52748900	59959500	61426900.00];
%y_IDBRMultiple  = [7592260	14434800	20155700	25135800	29005200	36920500	43801500	46830500	51608300	52562400.00];
%y_IDBRMultipleSelection = [7586490	13984300	19148600	22386800	24112700	25864500	35751500	39512600	45949700	47583300.00];

%%%%%
%% for average payment

y_IDBR = [211.84	271.61	364.01	438.70	528.34	682.48	752.88	783.79	809.48	819.74];
y_IDBRMultiple  = [208.86	269.01	366.08	447.15	527.90	669.98	724.40	743.17	778.13	779.48];
y_IDBRMultipleSelection = [163.3175	220.48375	304.34125	399.37375	469.24375	556.2825	693.79625	726.05625	774.1125	788.605];

%% for blocking probability
%y_SDBR = [0.00000000	0.00000000	0.00000000	0.00107034	0.00959605	0.22914000	0.81414600	0.90438600	0.98061600	0.99036500];
%y_SDBRMultiple = [0.00000000	0.00000000	0.00009964	0.00104788	0.00895032	0.24680800	0.81861000	0.90810800	0.98127500	0.99066800];
%y_SDBRMultipleSelection = [0.00000000	0.00000000	0.00186117	0.02259620	0.09211440	0.46678200	0.87654600	0.93989600	0.98743300	0.99381000];
									
%y_IDBR = [0.00000000	0.00000000	0.00031053	0.00256254	0.01642920	0.29509600	0.81214700	0.89678300	0.97603500	0.98763800];
%y_IDBRMultiple  = [0.00000000	0.00000000	0.00017757	0.00345764	0.02209410	0.31213300	0.83248800	0.90895600	0.97953000	0.98952400];
%y_IDBRMultipleSelection = [0.00000000	0.00000000	0.00322785	0.03006260	0.10780000	0.47873200	0.84668600	0.91367500	0.97940900	0.98931700];

%%%%%
%% for offloading volume

%y_SDBR = [213.66	271.94	356.60	451.24	553.18	716.31	757.05	752.38	759.41	764.53];
%y_SDBRMultiple = [215.66	275.24	353.80	451.48	539.76	729.32	748.07	758.36	756.01	761.03];
%y_SDBRMultipleSelection = [161.30875	224.77125	307.45375	401.1475	478.215	574.33375	612.4625	619.93625	621.81125	617.69];
									
%y_IDBR = [211.84	271.61	364.01	438.70	528.34	682.48	752.88	783.79	809.48	819.74];
%y_IDBRMultiple  = [208.86	269.01	366.08	447.15	527.90	669.98	724.40	743.17	778.13	779.48];
%y_IDBRMultipleSelection = [163.3175	220.48375	304.34125	399.37375	469.24375	556.2825	693.79625	726.05625	774.1125	788.605];

%% for download volume
%y_IDBR = [1.007001953	1.003356934	1.000910645	0.998017578	0.996480713	0.994627686	0.994033203	0.993041992	0.988630371	0.98838623];
%y_IDBRMultiple  = [1.015778809	1.008120117	1.00123291	0.998187256	0.99604248	0.996031494	0.994215088	0.993765869	0.993024902	0.992243652];
%y_IDBRMultipleSelection = [1.024172363	1.000216064	0.99800415	0.995505371	0.995169678	0.993453369	0.992957764	0.992741699	0.990900879	0.987138672];

%% for deadline miss

%y_IDBR = [0.00352996	0.00538206	0.0102174	0.0144413	0.0211107	0.0347292	0.0569469	0.0644627	0.0726221	0.0742004];
%y_IDBRMultiple  = [0.00300381	0.00545177	0.0108785	0.0156469	0.0227036	0.0360834	0.0527897	0.0592638	0.0673511	0.0688545];
%y_IDBRMultipleSelection = [0.00585243	0.00959941	0.0171413	0.0271852	0.034697	0.0469835	0.0763588	0.0834528	0.0916643	0.0932267];


i = i+1;
figure(i)

%marker_table = ["x", "s", "d", "+", "o"];

%semilogx(x_label,y_SDBR,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
%hold on
%semilogx(x_label,y_SDBRMultiple,'-s', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 1 0])
%hold on
%semilogx(x_label,y_SDBRMultipleSelection,'-h', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 0 1])
%hold on
semilogx(x_label,y_IDBR,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on
semilogx(x_label,y_IDBRMultiple,'-s', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 1 0])
hold on
semilogx(x_label,y_IDBRMultipleSelection,'-h', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 0 1])
hold on

xlabel('\lambda_\mu','FontSize', 14)
%ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15)
ylabel('Average User Payment ($)','FontSize', 15)
%ylabel('Blocking Probability')
%ylabel('Average Offloading Volume (MB)','FontSize', 15);
%ylabel('Average Download Volume (GB)','FontSize', 15);
%ylabel('P_{miss}','FontSize', 15);


xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', x_label);

%legend({'SDBR (const.-BW)','SDBR (multi-BW)','SDBR (WiFi selection)','IDBR (const.-BW)','IDBR (multi-BW)','IDBR (WiFi selection)'},'FontSize', 10,'NumColumns',1);
legend({'const.-BW','multi-BW with no WiFi selection','multi-BW with WiFi selection'},'FontSize', 11,'NumColumns',1);
%tix=get(gca,'xtick')';
%set(gca,'xticklabel',num2str(tix,'%.2f'))
%xlim([0, 10]);

% h = zeros(3, 1); 
% h(1) = plot(NaN,NaN,'-','Color',color_table(1,:), 'Marker', marker_table(:,1),'MarkerSize',11, 'LineWidth',1.2);
% h(2) = plot(NaN,NaN,'--','Color',color_table(2,:), 'Marker', marker_table(:,2),'MarkerSize',11, 'LineWidth',1.2);
% %h(3) = plot(NaN,NaN,'Color',color_table(3,:), 'Marker', marker_table(:,3),'MarkerSize',11, 'LineWidth',1.2);
% legend(h, 'Constant Bandwidth','Bandwidth Uncertainty with no WiFi selection','Bandwidth Uncertainty with WiFi selection','FontSize', 13);

%legend({'Static','DBR','SDBR', 'QEDF', 'QSSF'},'NumColumns',2);

hold off;
grid on;


