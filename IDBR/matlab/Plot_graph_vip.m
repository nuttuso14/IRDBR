x_label = [0.01	0.02	0.03	0.04	0.05	0.1	0.5	1	5	10];

color_table = [1 0 0 ; 0 1 0 ;1 0 0 ; 0 1 0 ;1 0 0 ; 0 1 0 ;];
marker_table = ["d","s","d","s","d","s"];
line_style_table = ["-","--","-","--","-","--"];

%% for Overall revenue

y_SDBR350 = [7294110.00	7392430.00	7573530.00	7593110.00	7779910.00	7966200.00	8322990.00	8366050.00	8563750.00	8588450.00];
y_IDBR350 = [7423150.00	7423190.00	7657830.00	8116030.00	8518880.00	9734440.00	12742300.00	13436000.00	15532800.00	15831600.00];
y_SDBR700 = [7492050.00	7570310.00	7613520.00	7674510.00	7732430.00	7922730.00	8012690.00	8383300.00	8503890.00	8558980.00];
y_IDBR700 = [7410700.00	7458850.00	7603630.00	7610240.00	8285280.00	9710400.00	14087100.00	15796700.00	19062300.00	19327000.00];
y_SDBR1400 = [7388770.00	7395220.00	7510700.00	7589980.00	7614560.00	8118420.00	8171080.00	8218700.00	8252200.00	8402810.00];
y_IDBR1400 = [7573583.00	7685480.00	7903240.00	7930550.00	8412920.00	10175100.00	12537200.00	14945500.00	16664000.00	17016800.00];


%%%%%

%% for average payment
%y_SDBR350 = [246.859	169.648	157.266	157.026	155.629	154.587	154.142	153.591	154.78	156.06];
%y_IDBR350 = [257.64	176.591	172.315	171.43	171.052	168.457	167.209	167.577	167.634	167.449];
									
%y_SDBR700 = [253.345	169.182	160.76	157.145	155.682	154.757	153.247	155.986	154.552	154.244];
%y_IDBR700 = [255.283	176.867	171.858	169.316	168.338	162.327	154.071	152.122	150.437	150.715];
									
%y_SDBR1400 = [253.803	168.328	157.795	156.254	156.525	154.6	153.566	153.465	156.144	154.924];
%y_IDBR1400 = [260.005	180.753	175.61	174.822	170.071	165.266	160.187	159.835	157.983	158.38];

%vals = [8588450.00	15831600.00; 8558980.00	19327000.00; 8518700.00	17016800.00];
%vals = [156.06	167.449; 154.244	150.715; 154.924	158.38];
%b = bar(x_label,vals);

 %xlabel('z_{VIP}','FontSize', 14)
 %ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15)
 %ylabel('Average User Payment ($)','FontSize', 15)
%legend({'SDBR','IDBR'},'NumColumns',1,'FontSize', 12);

% xtips1 = b(1).XEndPoints;
% ytips1 = b(1).YEndPoints;
% labels1 = string(b(1).YData);
% text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')
% 
% xtips2 = b(2).XEndPoints;
% ytips2 = b(2).YEndPoints;
% labels2 = string(b(2).YData);
% text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')

%b(1).FaceColor = 'r';
%b(2).FaceColor = 'g';
 
%%%%%

i = i+1;
figure(i)

%marker_table = ["x", "s", "d", "+", "o"];
semilogx(x_label,y_SDBR350,'-*', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on
semilogx(x_label,y_IDBR350,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on
semilogx(x_label,y_SDBR700,'-*', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 1 0])
hold on
semilogx(x_label,y_IDBR700,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color',[0 1 0])
hold on
semilogx(x_label,y_SDBR1400,'-*', 'MarkerSize',10, 'LineWidth',1.3,'Color','b')
hold on
semilogx(x_label,y_IDBR1400,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color','b')
hold on


xlabel('\lambda_\mu','FontSize', 14)
ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15)
%ylabel('Average User Payment ($)','FontSize', 15)
%ylabel('Blocking Probability')

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', x_label);

legend({'SDBR (z_{VIP}=0)','IDBR (z_{VIP}=0)','SDBR (z_{VIP}=0.5)', 'IDBR (z_{VIP}=0.5)','SDBR (z_{VIP}=1)','IDBR (z_{VIP}=1)'},'NumColumns',1,'FontSize', 12);

%tix=get(gca,'xtick')';
%set(gca,'xticklabel',num2str(tix,'%.2f'))
%xlim([0, 10]);

%  h = zeros(2, 1);
% h(1) = plot(NaN,NaN,'Color',color_table(2,:), 'Marker', marker_table(:,2),'MarkerSize',11, 'LineWidth',1.2);
% h(2) = plot(NaN,NaN,'Color',color_table(1,:), 'Marker', marker_table(:,1),'MarkerSize',11, 'LineWidth',1.2);
% legend(h, 'IDBR','SDBR','FontSize', 13);

%legend({'Static','DBR','SDBR', 'QEDF', 'QSSF'},'NumColumns',2);

hold off;
grid on;


