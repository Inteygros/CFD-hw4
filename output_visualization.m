output = readmatrix('output\output_m=100_n=100_w=1.5000.csv');   %%% 根据需要修改文件名
[n, m] = size(output);

x = linspace(0, 15, m);
y = linspace(0, 12, n); 

% 绘图
figure;
pcolor(x, y, output);
axis xy;  %左下角为坐标原点
shading interp;  % 平滑颜色过渡
colorbar;
colormap('jet');
xticks(0:1:15);  %刻度间隔为1
yticks(0:1:12);

xlabel('X (cm)');
ylabel('Y (cm)');
title('温度分布图');

saveas(gcf, 'figure\output_m=100_n=100_w=1.5000.png');  %%% 根据需要修改文件名