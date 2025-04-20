m = 60;
n = 50; %������Ҫ���ڲ���
file_str = ['output\wopt_m=', num2str(m), '_n=', num2str(n), '.csv'];
wopt = readmatrix(file_str);
title_str = ['�ɳ�����w������ٶȹ�ϵͼ m=', num2str(m), ' n=', num2str(n)];
figure_str = ['figure\wopt_m=', num2str(m), '_n=', num2str(n), '.png'];

% �ҵ���͵�����
[~, idx] = min(wopt(:,2));       % ��ȡ��Сֵ����
w_min = wopt(idx, 1);            % ����wֵ
iter_min = wopt(idx, 2);         % ��С��������

figure;
plot(wopt(:,1), wopt(:,2), 'LineWidth', 1);
hold on;
plot(w_min, iter_min, 'ro', 'MarkerSize', 6); % �����͵�
text(w_min, iter_min/1.1,...
    sprintf('(%.2f, %d)', w_min, iter_min)); % д����͵�����

ylim([min(wopt(:,2)/2),max(wopt(:,2)*2)]); %����y���ʵ���ʾ��Χ
set(gca, 'YScale', 'log'); %y������˶�������
xlabel('w'), ylabel('��������');
title(title_str);
grid on;
xticks(0:0.1:2);  %�̶ȼ��Ϊ1

saveas(gcf, figure_str);  %�洢Ϊ�ļ�