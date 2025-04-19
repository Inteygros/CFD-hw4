#include<stdio.h>
#include<cmath>

int main() {
    int m, n;// m，n分别是x，y方向网格等分数
    double w;//松弛因子
    printf("x方向等分数:");
    scanf("%d", &m);
    printf("y方向等分数:");
    scanf("%d", &n);
    double u[m + 1][n + 1];
    double dx, dy, beta;
    dx = 15.0 / double(m);
    dy = 12.0 / double(n);
    beta = dx / dy;
    char filename[256];

    //将m和n的值写入文件名
    snprintf(filename, sizeof(filename), "wopt_m=%d_n=%d.csv", m, n);

    FILE* fp = fopen(filename, "w");//输出文件

    //松弛因子从a增加到1.99,根据需要调整a，a太小会导致迭代极慢
    for (w = 0.01;w < 2;w += 0.01) {
        //初始化所有网格点为0
        for (int i = 0; i <= m; i++) {
            for (int j = 0; j <= n; j++) {
                u[i][j] = 0;
            }
        }

        double maxe;//最大残差，作为收敛判据
        int max = 0;//记录迭代次数

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
            max++;
            for (int i = 1;i < m;i++) {
                for (int j = 1;j < n;j++) {
                    double uij = u[i][j];
                    u[i][j] = w / 2 / (1 + beta * beta) * (u[i + 1][j] + u[i - 1][j] + beta * beta * (u[i][j + 1] + u[i][j - 1])) + (1 - w) * u[i][j];
                    maxe = fmax(maxe, fabs(u[i][j] - uij));
                }
            }
        } while (maxe > 1e-5);

        fprintf(fp, "%.4f %d\n", w, max);
    }

    fclose(fp);
    printf("\n数据已保存到wopt_m=%d_n=%d.csv\n", m, n);

    return 0;
}