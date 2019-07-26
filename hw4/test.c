#include <stdio.h>

int main()
{
    int a[2][3]={{1,2,3},{4,5,6}}, b[3][2]={{7,8},{9,10},{11,12}}, c[2][2]={{0}}, d[2][2]={{1,2},{3,4}}, i, j, k;
    for(i=0; i<2; i++){
	for(j=0;j<2;j++){
	    for(k=0;k<3;k++){
		c[i][j] += a[i][k]*b[k][j];
	    }
	}
    }
    for(i=0;i<2;i++){
	for(j=0;j<2;j++){
	    printf("%d ", c[i][j]);
	}
	printf("\n");
    }
    for(i=0;i<2;i++){
	for(j=0;j<2;j++)
	    c[i][j] += d[i][j];
    }

    for(i=0;i<2;i++){
        for(j=0;j<2;j++){
            printf("%d ", c[i][j]);
        }
        printf("\n");
    }
    return 0;
}
