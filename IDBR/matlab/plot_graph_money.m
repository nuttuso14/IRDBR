x_label = [0.01 0.02 0.03 0.04 0.05 0.1 0.5 1 5 10];

color_table = [1 0 0 ; 0 1 0 ;1 0 0 ; 0 1 0 ;1 0 0 ; 0 1 0 ;];
marker_table = ["d","s","d","s","d","s"];
line_style_table = ["-","--","-","--","-","--"];

%% for Overall revenue
y_IDBR350 = [3097610.00	2993770.00	2958390.00	3070190.00	3113700.00	3263710.00	3436170.00	3360990.00	3404620.00	3202770.00];
y_SDBR350 = [3211580.00	2982780.00	2864000.00	3087420.00	3248410.00	3688880.00	5140110.00	5813160.00	6045960.00	7012050.00];
									
y_IDBR700 = [7613520.00	7492050.00	7674510.00	7570310.00	7732430.00	8012690.00	7922730.00	8383300.00	8503890.00	8558980.00];
y_SDBR700 = [7610240.00	7458850.00	7410700.00	7603630.00	8285280.00	9710400.00	14087100.00	15796700.00	19062300.00	19327000.00];
									
y_IDBR1400 = [12019500.0000	11022000.0000	10707300.0000	10917000.0000	11120500.0000	11456800.0000	11779600.0000	12108500.0000	11836800.0000	12346000.0000];
y_SDBR1400 = [12028200.00	11102200.00	11469000.00	11654500.00	11527500.00	13741300.00	19312700.00	22138900.00	25977400.00	25674700.00];

%%%%%

%% for average payment
y_IDBR350 = [106.323	81.3789	78.1546	78.0227	77.8775	77.9356	78.1677	77.4798	78.3284	77.9643];
y_SDBR350 = [110.622	85.9194	84.4712	85.7736	83.4016	81.663	79.9221	79.5039	78.2466	78.5233];
									
y_IDBR700 = [253.345	169.182	160.76	157.145	155.682	154.757	153.247	155.986	154.552	154.244];
y_SDBR700 = [255.283	176.867	171.858	169.316	168.338	162.327	154.071	152.122	150.437	150.715];
									
y_IDBR1400 = [402.111	234.98	215.534	210.225	209.575	208.072	207.559	205.543	206.586	208.527];
y_SDBR1400 = [399.543	246.782	236.372	230.983	225.546	216.113	202.879	199.634	197.101	196.312];

%%%%%

i = i+1;
figure(i)

%marker_table = ["x", "s", "d", "+", "o"];

semilogx(x_label,y_IDBR350,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on
semilogx(x_label,y_SDBR350,'-s', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 1 0])
hold on
semilogx(x_label,y_IDBR700,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on
semilogx(x_label,y_SDBR700,'-s', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 1 0])
hold on
semilogx(x_label,y_IDBR1400,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on
semilogx(x_label,y_SDBR1400,'-s', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 1 0])
hold on

xlabel('\lambda_\mu','FontSize', 14)
%ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15)
ylabel('Average User Payment ($)','FontSize', 15)
%ylabel('Blocking Probability')

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', x_label);

%tix=get(gca,'xtick')';
%set(gca,'xticklabel',num2str(tix,'%.2f'))
%xlim([0, 10]);

 h = zeros(2, 1);
h(1) = plot(NaN,NaN,'Color',color_table(2,:), 'Marker', marker_table(:,2),'MarkerSize',11, 'LineWidth',1.2);
h(2) = plot(NaN,NaN,'Color',color_table(1,:), 'Marker', marker_table(:,1),'MarkerSize',11, 'LineWidth',1.2);
legend(h, 'IDBR','SDBR','FontSize', 13);

%legend({'Static','DBR','SDBR', 'QEDF', 'QSSF'},'NumColumns',2);

hold off;
grid on;


