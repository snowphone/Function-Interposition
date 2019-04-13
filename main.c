#include <stdio.h>
#include <stdlib.h>
#include "funcs.h"


int main(int argc, char *argv[])
{
	int n,i;
    if (argc < 2) {
		printf("Usage : %s number\n",argv[0]);
		exit(1);
	}
	
	n = atoi(argv[1]);
	for(i=0;i < n; i++) {
		funcReplaced();
	}
	
	endFunc();
	printf("funcReplaced is called %d times\nendFunc is called %d times\n",
		countReplaceFunc,countEndFunc);
    return(0);
}
