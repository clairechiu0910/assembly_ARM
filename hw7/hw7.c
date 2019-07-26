#include<stdio.h>
#include<stdlib.h>
#include<assert.h>

extern char trans(char c);
int main()
{
    FILE *fpin, *fpout;
    char c;	

    fpin=fopen("input.txt", "r");
    fpout=fopen("output.txt", "w");
    assert(fpin!=NULL);
    assert(fpout!=NULL);

    while(fscanf(fpin, "%c", &c) != EOF){
	c=trans(c);  //use ARM assembly code
	fprintf(fpout, "%c", c);
    }
    return 0;
}
