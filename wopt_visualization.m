m = 60;
n = 50; %根据需要调节参数
file_str = ['output\wopt_m=', num2str(m), '_n=', num2str(n), '.csv'];
wopt = readmatrix(file_str);
title_str = ['松弛因子w与迭代速度关系图 m=', num2str(m), ' n=', num2str(n)];
figure_str = ['figure\wopt_m=', num2str(m), '_n=', num2str(n), '.png'];

% 找到最低点坐标
[~, idx] = min(wopt(:,2));       % 获取最小值索引
w_min = wopt(idx, 1);            % 最优w值
iter_min = wopt(idx, 2);         % 最小迭代次数

figure;
plot(wopt(:,1), wopt(:,2), 'LineWidth', 1);
hold on;
plot(w_min, iter_min, 'ro', 'MarkerSize', 6); % 标记最低点
text(w_min, iter_min/1.1,...
    sprintf('(%.2f, %d)', w_min, iter_min)); % 写出最低点坐标

ylim([min(wopt(:,2)/2),max(wopt(:,2)*2)]); %设置y合适的显示范围
set(gca, 'YScale', 'log'); %y轴采用了对数坐标
xlabel('w'), ylabel('迭代次数');
title(title_str);
grid on;
xticks(0:0.1:2);  %刻度间隔为1

saveas(gcf, figure_str);  %存储为文件