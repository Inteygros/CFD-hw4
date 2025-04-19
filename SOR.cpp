#include<stdio.h>
#include<cmath>

int main() {
    int m, n;// m，n分别是x，y方向网格等分数
    double w;//松弛因子
    printf("x方向等分数:");
    scanf("%d", &m);
    printf("y方向等分数:");
    scanf("%d", &n);
    printf("松弛因子:");
    scanf("%lf", &w);

    double u[m + 1][n + 1];
    //初始化所有网格点为0
    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            u[i][j] = 0;
        }
    }
    double dx, dy, beta;
    dx = 15.0 / double(m);
    dy = 12.0 / double(n);
    beta = dx / dy;

    char filename[256];

    //将m和n的值写入文件名
    snprintf(filename, sizeof(filename), "output_m=%d_n=%d.csv", m, n);

    FILE* fp = fopen(filename, "w");//输出文件

    double maxe;//最大残差，作为收敛判据

    //初始化u边界
    for (int i = 0;i <= m;i++) {
        u[i][0] = 20;
        u[i][n] = 100;
    }
    for (int j = 1;j < n;j++) {
        u[0][j] = 20;
        u[m][j] = 20;
    }

    //从左向右，从下到上迭代
    do {
        maxe = 0;
        for (int i = 1;i < m;i++) {
            for (int j = 1;j < n;j++) {
                double uij = u[i][j];
                u[i][j] = w / 2 / (1 + beta * beta) * (u[i + 1][j] + u[i - 1][j] + beta * beta * (u[i][j + 1] + u[i][j - 1])) + (1 - w) * u[i][j];
                maxe = fmax(maxe, fabs(u[i][j] - uij));
            }
        }
    } while (maxe > 1e-5);

    //写入文件
    for (int j = 0;j <= n;j++) {
        for (int i = 0;i < m;i++) {
            fprintf(fp, "%lf ", u[i][j]);
        }
        fprintf(fp, "%lf\n", u[m][j]);
    }

    fclose(fp);
    printf("\n数据已保存到output_m=%d_n=%d.csv\n", m, n);

    return 0;
}