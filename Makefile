CFLAGS= -Wall

%.o: %.c
	$(CC) -c $< $(CFLAGS)

normal:
	$(CC) -o normal main.o funcs.o

link: myfunc.o
	$(CC) -o link  \
	-Wl,--wrap,funcReplaced -Wl,--wrap,endFunc \
	main.o $< funcs.o 


clean:
	$(RM) normal myfunc.o link
