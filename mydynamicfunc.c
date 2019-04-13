#define _GNU_SOURCE
#include <stdio.h>
#include <dlfcn.h>

void funcReplaced() {
	void(*actualFunc)(void) = dlsym(RTLD_NEXT, "funcReplaced");
	actualFunc();
	puts("In wrap_funcReplaced");
}

void endFunc() {
	void(*actualFunc)(void) = dlsym(RTLD_NEXT, "endFunc");
	actualFunc();
	puts("In wrap_endFunc");
}
