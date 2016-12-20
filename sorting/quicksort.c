#include <stdio.h>
#include <stdlib.h>
#include "quicksort.h"

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
    quicksort (n, a, 0, n-1);
    printf ("Sorted array: [");
    for (ind = 0; ind < n-1; ind ++) {
        printf ("%d, ", *(a+ind));
    }
    printf ("%d]\n", *(a+n-1));
    free (a);
    return 0;
}

void quicksort (int n, int *ary, int p, int q) {
    if (q > p) {
        int boundary = partition (ary+p, (q-p+1));
        quicksort (n, ary, p, p + boundary - 1);
        quicksort (n, ary, p + boundary + 1, q);
    }
}

int partition (int *arr, int arr_size) {
    int pivot = arr[arr_size - 1];
    int i=-1, j, tmp;
    for (j = 0; j < arr_size-1; j ++) {
        if (arr[j] < pivot) {
            i ++;
            tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }
    i ++;
    arr[arr_size - 1] = arr[i];
    arr[i] = pivot;
    return i;
}
