CFLAGS = -g -Wall -Werror -pedantic-errors \
	-Wshadow -O0 -Wwrite-strings 

all: show_ip getaddr_basic

clean:
	rm -f *.o
	rm -f a.out

show_ip: show_ip.o
	gcc -o show_ip.exe show_ip.o

show_ip.o: show_ip.c
	gcc -c $(CFLAGS) show_ip.c

getaddr_basic: getaddr_basic.o
	gcc -o getaddr_basic.exe getaddr_basic.o

getaddr_basic.o: getaddr_basic.c
	gcc -c $(CFLAGS) getaddr_basic.c

