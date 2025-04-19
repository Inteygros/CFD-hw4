m = 10;
n = 10; %根据需要调节参数
file_str = ['output\output_m=', num2str(m), '_n=', num2str(n), '.csv'];
title_str = ['温度分布图 m=', num2str(m), ' n=', num2str(m)];
figure_str = ['figure\output_m=', num2str(m), '_n=', num2str(n), '.png'];

output = readmatrix(file_str);   %%% 根据需要修改文件名
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
title(title_str);

saveas(gcf, figure_str);  %%% 根据需要修改文件名