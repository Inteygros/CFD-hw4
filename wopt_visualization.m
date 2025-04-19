m = 10;
n = 10; %������Ҫ���ڲ���
file_str = ['output\wopt_m=', num2str(m), '_n=', num2str(n), '.csv'];
wopt = readmatrix(file_str);
title_str = ['�ɳ�����w������ٶȹ�ϵͼ m=', num2str(m), ' n=', num2str(m)];
figure_str = ['figure\wopt_m=', num2str(m), '_n=', num2str(n), '.png'];

figure;
plot(wopt(:,1), wopt(:,2), 'LineWidth', 1);
ylim([min(wopt(:,2)/2),max(wopt(:,2)*2)]); %����y���ʵ���ʾ��Χ
set(gca, 'YScale', 'log');
xlabel('w'), ylabel('��������');
title(title_str);
grid on;
xticks(0:0.1:2);  %�̶ȼ��Ϊ1

saveas(gcf, figure_str);  %�洢Ϊ�ļ�