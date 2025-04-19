output = readmatrix('output\output_m=100_n=100_w=1.5000.csv');   %%% ������Ҫ�޸��ļ���
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
title('�¶ȷֲ�ͼ');

saveas(gcf, 'figure\output_m=100_n=100_w=1.5000.png');  %%% ������Ҫ�޸��ļ���