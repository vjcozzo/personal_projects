CFLAGS = -g -Wall -Werror -pedantic-errors \
	-Wshadow -O0 -Wwrite-strings 

all: quicksort heapsort mergesort selection print_permutations

clean:
	rm -f *.o
	rm -f a.out

quicksort: quicksort.o
	gcc -o quicksort.exe quicksort.o

quicksort.o: quicksort.c
	gcc -c $(CFLAGS) quicksort.c

selection: selection.o
	gcc -o selection.exe selection.o

selection.o: selection.c
	gcc -c $(CFLAGS) selection.c

mergesort: mergesort.o
	gcc -o mergesort.exe mergesort.o

mergesort.o: mergesort.c
	gcc -c $(CFLAGS) mergesort.c

heapsort: heapsort.o
	gcc -o heapsort.exe heapsort.o

heapsort.o: heapsort.c
	gcc -c $(CFLAGS) heapsort.c

print_permutations: print_permutations.o sortingtest.o
	gcc -o print_permutations print_permutations.o sortingtest.o

print_permutations.o: print_permutations.c sortingtest.h
	gcc -c $(CFLAGS) print_permutations.c

sortingtest.o: sortingtest.c sortingtest.h
	gcc -c $(CFLAGS) sortingtest.c


