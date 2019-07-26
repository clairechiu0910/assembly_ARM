#include <mmintrin.h>
#include <xmmintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
	clock_t start, end;
	start=clock();

	int i, j;
	float ans;
	float a[200][204]__attribute__((aligned(16)));
	float b[200][204]__attribute__((aligned(16)));
	float c[200][204]__attribute__((aligned(16)));
	float tmp[4]__attribute__((aligned(16)));
	__m128 *ap, *bp, *cp, *tmpp;
	FILE *fp;
	fp=fopen("data.txt", "r");
	
	for(i=0; i<200; i++){
		for(j=0; j<202; j++)
			fscanf(fp, "%f", &a[i][j]);
		a[i][202]=a[i][203]=0;
	}
	for(i=0; i<200; i++){
		for(j=0; j<202; j++)
			fscanf(fp, "%f", &b[i][j]);
		b[i][202]=b[i][203]=0;
	}
	for(i=0; i<200; i++){
		for(j=0; j<202; j++)
			fscanf(fp, "%f", &c[i][j]);
		c[i][202]=c[i][203]=0;
	}
	fclose(fp);
	fp=fopen("outputsimd.txt", "w");

	ap=(__m128*)a; //change a to (__m128*) pointer
	bp=(__m128*)b;
	cp=(__m128*)c;
	tmpp=(__m128*)tmp;
	for(i=0; i<200; i++){
		ans=0;
		for(j=0; j<51; j++, ap++, bp++, cp++){  // (204/4)=51
			*tmpp=_mm_mul_ps(*ap, *bp); //save a[0]-a[3]*b[0]-b[3] to tmp[0]-tmp[3]
			ans+=tmp[0]+tmp[1]+tmp[2]+tmp[3];
			*tmpp=_mm_mul_ps(*ap, *cp);
			ans+=tmp[0]+tmp[1]+tmp[2]+tmp[3];
		}
		fprintf(fp, "%f\n", ans);
	}
	fclose(fp);

	end=clock();
	double diff=(double)end-start;
	printf("%f sec\n", diff/CLOCKS_PER_SEC);
	return 0;
}
