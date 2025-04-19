m = 10;
n = 10; %������Ҫ���ڲ���
file_str = ['output\output_m=', num2str(m), '_n=', num2str(n), '.csv'];
title_str = ['�¶ȷֲ�ͼ m=', num2str(m), ' n=', num2str(m)];
figure_str = ['figure\output_m=', num2str(m), '_n=', num2str(n), '.png'];

output = readmatrix(file_str);   %%% ������Ҫ�޸��ļ���
[n, m] = size(output);

x = linspace(0, 15, m);
y = linspace(0, 12, n); 

% ��ͼ
figure;
pcolor(x, y, output);
axis xy;  %���½�Ϊ����ԭ��
shading interp;  % ƽ����ɫ����
colorbar;
colormap('jet');
xticks(0:1:15);  %�̶ȼ��Ϊ1
yticks(0:1:12);

xlabel('X (cm)');
ylabel('Y (cm)');
title(title_str);

saveas(gcf, figure_str);  %%% ������Ҫ�޸��ļ���