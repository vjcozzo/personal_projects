CFLAGS = -g -Wall -Werror -pedantic-errors \
	-Wshadow -O0 -Wwrite-strings 

all: test_heapsort test_expected_value # variance

clean:
	rm -f *.o
	rm -f a.out

test_heapsort: heapsort.o test_heapsort.o
	gcc -o test_heapsort.exe heapsort.o test_heapsort.o

test_heapsort.o: test_heapsort.c
	gcc -c $(CFLAGS) test_heapsort.c heapsort.c

#heapsort.o: heapsort.c heapsort.h
#	gcc -c $(CFLAGS) heapsort.c
#
test_expected_value: expected_value.o heapsort.o test_expected_value.o
	gcc -o test_expected_value.exe expected_value.o test_expected_value.o

expected_value.o: expected_value.c expected_value.h heapsort.h
	gcc -c $(CFLAGS) expected_value.c

test_expected_value.o: test_expected_value.h test_expected_value.c
	gcc -c $(CFLAGS) test_expected_value.c

#variance: variance.o
#	gcc -o variance.exe variance.o
#
#variance.o: variance.c
#	gcc -c $(CFLAGS) variance.c
#

