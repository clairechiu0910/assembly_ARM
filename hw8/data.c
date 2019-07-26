#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
	int i, j, t;
	float num;
	FILE *fp;
	fp=fopen("data.txt", "w");
	srand(time(NULL));

	for(t=0; t<3; t++){
		for(i=0; i<200; i++){
			for(j=0; j<200; j++){
				num=(float)rand()/(float)RAND_MAX;
				fprintf(fp, "%f ", num);
			}
			fprintf(fp, "\n");
		}
	}
	fclose(fp);
	return 0;
}
