#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
	clock_t start, end;
	start=clock();

	float a[200][202]={0}, b[200][202]={0}, c[200][202]={0};
	float ans;
	int i, j;
	FILE *fp;
	fp=fopen("data.txt", "r");
	for(i=0; i<200; i++)
		for(j=0; j<202; j++)
			fscanf(fp, "%f", &a[i][j]);
	for(i=0; i<200; i++)
		for(j=0; j<202; j++)
			fscanf(fp, "%f", &b[i][j]);
	for(i=0; i<200; i++)
		for(j=0; j<202; j++)
			fscanf(fp, "%f", &c[i][j]);
	fclose(fp);
	fp=fopen("output.txt", "w");
	for(i=0; i<200; i++){
		ans=0;
		for(j=0; j<202; j++){
				ans+=a[i][j]*b[i][j];
				ans+=a[i][j]*c[i][j];
		}
		fprintf(fp, "%f\n", ans);
	}
	fclose(fp);

	end=clock();
	double diff=(double)end-start;
	printf("%f sec\n", diff/CLOCKS_PER_SEC);
	return 0;
}
