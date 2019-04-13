CFLAGS= -Wall


%.o: %.c
	$(CC) -c $< $(CFLAGS)

all: normal link run

normal:
	$(CC) -o $@ main.o funcs.o

link: myfunc.o
	$(CC) -o $@  \
	-Wl,--wrap,funcReplaced -Wl,--wrap,endFunc \
	main.o $< funcs.o 

run: mydynamicfunc.so
	$(CC) -L. -o $@ main.o -lfuncs 
	
mydynamicfunc.so: mydynamicfunc.c
	$(CC) $(CFLAGS) -shared -fpic $< -ldl -o $@

clean:
	$(RM) normal myfunc.o link mydynamicfunc.so run
