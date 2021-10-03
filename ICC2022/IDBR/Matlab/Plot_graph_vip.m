x_label = [0.01	0.02	0.03	0.04	0.05	0.1	0.5	1	5	10];

color_table = [1 0 0 ; 0 1 0 ;1 0 0 ; 0 1 0 ;1 0 0 ; 0 1 0 ;];
marker_table = ["d","s","d","s","d","s"];
line_style_table = ["-","--","-","--","-","--"];

%% for Overall revenue
%y_SDBR = [7830050.00	7542180.00	7866540.00	8364150.00	8419190.00	8650640.00	9104290.00	9165140.00	9152840.00	8908060.00];
%y_IDBR0 = [8005220.00	7836640.00	8119560.00	8530140.00	9158230.00	10401100.00	14287100.00	15543700.00	16693800.00	17528300.00];
%y_IDBR05 = [7871160.00	8198820.00	8218390.00	8538410.00	9187380.00	10709500.00	15866000.00	17610400.00	19561400.00	21517200.00];
%y_IDBR1 = [7778480.00	8373320.00	7846490.00	8700440.00	9063830.00	10589700.00	14274200.00	15702900.00	17555800.00	18321900.00];

%%%%%

%% for average payment
y_SDBR = [261.002	171.39	164.81	163.63	163.24	161.98	162.46	163	163.505000	162.969000];
y_IDBR0 = [266.352000	183.425000	180.318	180.482000	180.682000	178.845000	177.817	178.468	178.238	178.808];
y_IDBR05 = [262.346000	185.343000	179.621000	178.437	176.541	170.795	164.273	162.984	160.902	160.859];
y_IDBR1 = [262.467	187.776	182.277	182.323	180.21	175.608	171.518	170.497	170.426	170.15];


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
semilogx(x_label,y_SDBR,'-d', 'MarkerSize',10, 'LineWidth',1.3,'Color','b')
hold on
semilogx(x_label,y_IDBR0,'-*', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on
semilogx(x_label,y_IDBR05,'-s', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on
semilogx(x_label,y_IDBR1,'-o', 'MarkerSize',10, 'LineWidth',1.3,'Color',[1 0 0])
hold on



xlabel('\lambda_\mu','FontSize', 14)
%ylabel('Mobile Operator Overall Revenue ($)','FontSize', 15)
ylabel('Average User Payment ($)','FontSize', 15)
%ylabel('Blocking Probability')

xticklabels({'0.01','0.02','0.03','0.04','0.05','0.1','0.5','1','5','10'});
set(gca, 'XTick', x_label);

legend({'SDBR','IDBR (z_{VIP}=0)', 'IDBR (z_{VIP}=0.5)', 'IDBR (z_{VIP}=1)'},'NumColumns',1,'FontSize', 12);

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


