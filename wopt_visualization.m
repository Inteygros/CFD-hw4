m = 10;
n = 10; %根据需要调节参数
file_str = ['output\wopt_m=', num2str(m), '_n=', num2str(n), '.csv'];
wopt = readmatrix(file_str);
title_str = ['松弛因子w与迭代速度关系图 m=', num2str(m), ' n=', num2str(m)];
figure_str = ['figure\wopt_m=', num2str(m), '_n=', num2str(n), '.png'];

figure;
plot(wopt(:,1), wopt(:,2), 'LineWidth', 1);
ylim([min(wopt(:,2)/2),max(wopt(:,2)*2)]); %设置y合适的显示范围
set(gca, 'YScale', 'log');
xlabel('w'), ylabel('迭代次数');
title(title_str);
grid on;
xticks(0:0.1:2);  %刻度间隔为1

saveas(gcf, figure_str);  %存储为文件