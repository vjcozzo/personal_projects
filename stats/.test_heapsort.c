#include <stdio.h>
#include <stdlib.h>
#include "heapsort.h"

int main (int argc, char **argv) {
    int ind, n, *a = NULL;
    if (argc < 2) {
        printf ("Please enter the number of values in the array: ");
        scanf ("%d", &n);
        printf ("\n");

        a = malloc (n*sizeof(int));
        for (ind = 0; ind < n; ind ++) {
            scanf ("%d", (a+ind)); 
        }
    } else {
        int tmp; 
        n = atoi (argv[1]);
        tmp = n + 2;
        if (tmp != (argc)) {
            printf("ERR - array size appears inconsistent.\n\n%d does not match the given %d.\n", (argc - 2), n);
            return -1;
        }

        a = malloc (n*sizeof(int));

        for (ind = 2; ind < tmp; ind ++) {
            a[ind - 2] = atoi(argv[ind]);
        }
    }
    printf("Size = %d\n", n);
    heapify (n, a);
    printf ("Heapified array: [");
    for (ind = 0; ind < n-1; ind ++) {
        printf ("%d, ", *(a+ind));
    }
    printf ("%d]\n", *(a+n-1));
    heapsort (n, a);
    printf ("Sorted array: [");
    for (ind = 0; ind < n-1; ind ++) {
        printf ("%d, ", *(a+ind));
    }
    printf ("%d]\n", *(a+n-1));
    free (a);
    return 0;
}
